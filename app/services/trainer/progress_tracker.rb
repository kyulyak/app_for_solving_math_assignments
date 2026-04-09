module Trainer
  class ProgressTracker
    def initialize(user:, task:, submitted_answer:, is_correct:, shown_solution: false)
      @user = user
      @task = task
      @submitted_answer = submitted_answer
      @is_correct = is_correct
      @shown_solution = shown_solution
    end

    def call
      Attempt.create!(
        user: @user,
        problem: @task,
        user_answer: @submitted_answer,
        is_correct: @is_correct,
        shown_solution: @shown_solution,
        solved_at: Time.current
      )
    end
  end
end
