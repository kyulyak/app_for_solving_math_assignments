class ProblemsController < ApplicationController
  def new
    @subtopic = Subtopic.find(params[:subtopic_id])
    @problem = @subtopic.problems.new
  end

   def show
    @topic = Topic.find(params[:topic_id])
    @subtopic = Subtopic.find(params[:subtopic_id])
    @problem = Problem.find(params[:id])
   end
end
