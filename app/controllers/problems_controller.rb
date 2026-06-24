class ProblemsController < ApplicationController
  before_action :set_problem_context, only: [ :show, :check_answer, :next_generated, :show_solution ]

  def show
    @generated_problem = generate_problem_data
    @check_result = nil
  end

  def check_answer
    @generated_problem = generated_problem_from_params
    submitted_answer = normalize_submitted_answer

    if submitted_answer.blank?
      @check_result = nil
      render :show, status: :ok
      return
    end

    @check_result = Trainer::GeneratedAnswerChecker.new(
      correct_answer: @generated_problem["correct_answer"],
      submitted_answer: submitted_answer,
      problem_type: @problem.problem_type
    ).call

    track_attempt(submitted_answer) if current_user.present?

    render :show, status: :ok
  end

  def show_solution
    @generated_problem = generated_problem_from_params

    @check_result = {
      correct: false,
      submitted_answer: params[:submitted_answer],
      correct_answer: @generated_problem["correct_answer"],
      show_solution: true
    }

    if current_user.present?
      Trainer::ProgressTracker.new(
        user: current_user,
        task: @problem,
        submitted_answer: params[:submitted_answer],
        is_correct: false,
        shown_solution: true,
        problem_content: @generated_problem["content"],
        correct_answer: @generated_problem["correct_answer"],
        solution: @generated_problem["solution"]
      ).call
    end

    render :show, status: :ok
  end

  def next_generated
    redirect_to topic_subtopic_problem_path(@topic, @subtopic, @problem)
  end

  private

  def normalize_submitted_answer
    if @generated_problem["answer_type"] == "matrix" || @generated_problem["answer_type"] == "matrix_with_factor"
      return nil if params[:submitted_answer].blank?

      rows = params[:submitted_answer].to_unsafe_h.values

      matrix = rows.map do |row|
        row.values.map { |value| value.to_s.strip }
      end

      return nil if matrix.flatten.any?(&:blank?)

      matrix_string = "[[#{matrix[0][0]},#{matrix[0][1]}],[#{matrix[1][0]},#{matrix[1][1]}]]"

      if @generated_problem["answer_type"] == "matrix_with_factor"
        factor = params[:submitted_factor].to_s.strip
        return nil if factor.blank?

        "#{factor}*#{matrix_string}"
      else
        matrix_string
      end
    else
      params[:submitted_answer].to_s.strip
    end
  end

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

  def generated_problem_from_params
    {
      "content" => params[:generated_content],
      "correct_answer" => params[:generated_correct_answer],
      "solution" => params[:generated_solution],
      "answer_type" => params[:generated_answer_type],
      "matrix_rows" => params[:generated_matrix_rows].to_i,
      "matrix_cols" => params[:generated_matrix_cols].to_i
    }
  end

  def track_attempt(submitted_answer)
    Trainer::ProgressTracker.new(
      user: current_user,
      task: @problem,
      submitted_answer: submitted_answer,
      is_correct: @check_result[:correct],
      problem_content: @generated_problem["content"],
      correct_answer: @generated_problem["correct_answer"],
      solution: @generated_problem["solution"]
    ).call
  end
end
