class SolutionsController < ApplicationController
  def show
    @problem = Problem.find(params[:problem_id])

    result = Trainer::SolutionViewer.new(task: @problem).call

    @solution = result[:solution_text]
  end
end
