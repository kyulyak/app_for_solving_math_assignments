class PagesController < ApplicationController
  def home
    # Если пользователь залогинен, показываем персонализированный контент
    if logged_in?
      @recent_topics = Topic.limit(4)
      @recent_problems = Problem.includes(:topic).order(created_at: :desc).limit(5)
    end
  end

  def about
  end
end
