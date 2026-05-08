module Trainer
  class ProgressTracker
    def initialize(
      user:,
      task:,
      submitted_answer:,
      is_correct:,
      shown_solution: false,
      problem_content: nil,
      correct_answer: nil,
      solution: nil
    )
      @user = user
      @task = task
      @submitted_answer = submitted_answer
      @is_correct = is_correct
      @shown_solution = shown_solution
      @problem_content = problem_content
      @correct_answer = correct_answer
      @solution = solution
    end

    def call
      Attempt.create!(
        user: @user,
        problem: @task,
        user_answer: @submitted_answer,
        is_correct: @is_correct,
        shown_solution: @shown_solution,
        solved_at: Time.current,
        problem_content: @problem_content,
        correct_answer: @correct_answer,
        solution: @solution
      )
    end
  end
end
