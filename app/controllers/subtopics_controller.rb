class SubtopicsController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @subtopic = @topic.subtopics.find(params[:id])
    @problems = @subtopic.problems
  end
end
