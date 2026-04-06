class TopicsController < ApplicationController
  def index
    @topics = Topic.all.order(:title)
  end

  def show
    @topic = Topic.find(params[:id])
    if @topic.has_subtopics?
    @subtopics = @topic.subtopics
    else
      @problems = @topic.problems
    end
  end
end
