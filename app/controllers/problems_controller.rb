class ProblemsController < ApplicationController
  def show
    @problems = @topic.problems.published
  end
end
