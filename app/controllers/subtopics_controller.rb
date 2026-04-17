class SubtopicsController < ApplicationController
   def show
    @topic = Topic.find_by(id: params[:topic_id])
    return redirect_to(topics_path, alert: "Тема не найдена") unless @topic

    @subtopic = @topic.subtopics.find_by(id: params[:id])
    return redirect_to(topic_path(@topic), alert: "Подтема не найдена") unless @subtopic

    @problems = @subtopic.problems
   end
end
