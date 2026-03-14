class ApplicationController < ActionController::Base
  # Только для Rails API режима нужно раскомментировать:
  # protect_from_forgery with: :exception

  # Вспомогательные методы, доступные во всех контроллерах и представлениях
  helper_method :current_user, :logged_in?

  def create
      result = Trainer::AnswerChecker.new(
        task: @task,
        submitted_answer: params[:submitted_answer]
      ).call

      Trainer::ProgressTracker.new(
        user: current_user,
        task: @task,
        submitted_answer: params[:submitted_answer],
        is_correct: result[:correct]
      ).call

      if result[:correct]
        flash[:notice] = "Ответ верный"
      else
        flash[:alert] = "Ответ неверный"
      end

      redirect_to task_path(@task)
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end


  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      flash[:alert] = "Пожалуйста, войдите в систему"
      redirect_to login_path
    end
  end

  def require_admin
    unless current_user&.admin?
      flash[:alert] = "У вас нет прав для выполнения этого действия"
      redirect_to root_path
    end
  end
end
