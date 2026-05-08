class ProgressController < ApplicationController
  before_action :authenticate_user!

  def show
    @attempts = current_user.attempts
                            .includes(problem: :topic)
                            .order(created_at: :desc)

    @total_attempts = @attempts.count
    @correct_attempts = @attempts.where(is_correct: true).count
    @wrong_attempts = @attempts.where(is_correct: false).count

    @solved_problems_count = @attempts.where(is_correct: true).count
  end
end
