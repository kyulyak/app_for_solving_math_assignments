class ProblemsController < ApplicationController
  before_action :set_problem_context, only: [ :show, :check_answer, :next_generated ]

  def show
    session[:generated_problems] ||= {}

    @generated_problem = session[:generated_problems][@problem.id.to_s]

    unless @generated_problem
      @generated_problem = generate_problem_data
      session[:generated_problems][@problem.id.to_s] = @generated_problem
    end

    @check_result = nil
  end

  def check_answer
    session[:generated_problems] ||= {}

    @generated_problem = session[:generated_problems][@problem.id.to_s]

    unless @generated_problem
      @generated_problem = generate_problem_data
      session[:generated_problems][@problem.id.to_s] = @generated_problem
    end

    submitted_answer = params[:submitted_answer]

    @check_result = Trainer::GeneratedAnswerChecker.new(
      correct_answer: @generated_problem["correct_answer"],
      submitted_answer: submitted_answer
    ).call

    if current_user.present?
      Trainer::ProgressTracker.new(
        user: current_user,
        task: @problem,
        submitted_answer: submitted_answer,
        is_correct: @check_result[:correct]
      ).call
    end

    render :show, status: :ok
  end

  def next_generated
    session[:generated_problems] ||= {}
    session[:generated_problems].delete(@problem.id.to_s)

    redirect_to topic_subtopic_problem_path(@topic, @subtopic, @problem)
  end

  private

  def set_problem_context
    @problem = Problem.find(params[:id])
    @subtopic = @problem.subtopic
    @topic = @problem.topic
  end

  def generate_problem_data
    generator = ProblemGenerators::Factory.build(@problem)

    if generator
      generator.call.deep_stringify_keys
    else
      {
        "content" => @problem.content,
        "correct_answer" => @problem.correct_answer,
        "solution" => @problem.solution
      }
    end
  end
end
