class TopicsController < ApplicationController
  def index
    @topics = Topic.all.order(:title)
  end

  def show
    @topic = Topic.find(params[:id])
    @problems = @topic.problems
  end
end
