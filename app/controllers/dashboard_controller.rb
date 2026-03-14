class DashboardController < ApplicationController
  def index
    @recent_solutions = current_user.user_solutions
                                    .includes(:problem)
                                    .order(created_at: :desc)
                                    .limit(10)

    @topics_progress = Topic.all.map do |topic|
      {
        topic: topic,
        progress: current_user.progress_by_topic(topic.id),
        total_problems: topic.problems.count
      }
    end

    @favorites_count = current_user.favorites.count
    @total_solved = current_user.user_solutions
                                .where(is_correct: true)
                                .select(:problem_id)
                                .distinct
                                .count
  end

  def progress
    @progress_data = Topic.all.map do |topic|
      {
        name: topic.title,
        data: current_user.progress_by_topic(topic.id)
      }
    end
  end

  def favorites
    @favorites = current_user.favorites.includes(problem: :topic)
  end

  def history
    @solutions = current_user.user_solutions
                            .includes(problem: :topic)
                            .order(created_at: :desc)
                            .page(params[:page])
  end
end
