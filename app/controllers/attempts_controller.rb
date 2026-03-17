class AttemptsController < ApplicationController
  def create
    @problem = Problem.find(params[:problem_id])
    submitted_answer = params[:submitted_answer]

    result = Trainer::AnswerChecker.new(
      task: @problem,
      submitted_answer: submitted_answer
    ).call

    Trainer::ProgressTracker.new(
      user: current_user,
      task: @problem,
      submitted_answer: submitted_answer,
      is_correct: result[:correct]
    ).call

    flash[:result] = result[:correct] ? "Ответ верный!" : "Ответ неверный"

    redirect_to problem_path(@problem)
  end
end
