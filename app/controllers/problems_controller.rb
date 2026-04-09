class ProblemsController < ApplicationController
  before_action :set_problem_context, only: [ :show, :check_answer ]

  def show
    generated = generate_problem_data

    session[:generated_problems] ||= {}
    session[:generated_problems][@problem.id.to_s] = generated

    @generated_problem = generated
  end

  def check_answer
    session[:generated_problems] ||= {}
    generated_problem = session[:generated_problems][@problem.id.to_s]

    unless generated_problem
      redirect_to topic_subtopic_problem_path(@topic, @subtopic, @problem),
                  alert: "Сначала откройте задачу заново."
      return
    end

    submitted_answer = params[:submitted_answer]

    result = Trainer::GeneratedAnswerChecker.new(
      correct_answer: generated_problem["correct_answer"],
      submitted_answer: submitted_answer
    ).call

    Trainer::ProgressTracker.new(
      user: current_user,
      task: @problem,
      submitted_answer: submitted_answer,
      is_correct: result[:correct]
    ).call

    flash[:result] = result[:correct] ? "Ответ верный!" : "Ответ неверный"
    flash[:solution] = generated_problem["solution"]
    flash[:generated_content] = generated_problem["content"]

    redirect_to topic_subtopic_problem_path(@topic, @subtopic, @problem)
  end

  private

  def set_problem_context
    @topic = Topic.find(params[:topic_id])
    @subtopic = Subtopic.find(params[:subtopic_id])
    @problem = Problem.find(params[:id])
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
