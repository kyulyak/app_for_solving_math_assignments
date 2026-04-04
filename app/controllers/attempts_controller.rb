class AttemptsController < ApplicationController
  def create
    problem = Problem.find(params[:attempt][:problem_id])
    answer = params[:attempt][:answer]

    result = Attempts::CreateService.call(
      user: current_user,
      problem: problem,
      answer: answer
    )

    flash[:result] = result[:correct] ? "Ответ верный!" : "Ответ неверный"

    redirect_to problem_path(problem)
  end
end
