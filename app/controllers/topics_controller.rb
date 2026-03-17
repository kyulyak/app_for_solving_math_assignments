class TopicsController < ApplicationController
  def index
    @topics = Topic.all.order(:title)
  end

  def show
    @topic = Topic.find(params[:id])
    @problems = @topic.problems.where(is_published: true).order(:position)
  end
end
