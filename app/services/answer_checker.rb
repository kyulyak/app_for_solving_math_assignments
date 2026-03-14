# app/services/trainer/answer_checker.rb
module Trainer
  class AnswerChecker
    def initialize(task:, submitted_answer:)
      @task = task
      @submitted_answer = submitted_answer
    end

    def call
      normalized_submitted = normalize(@submitted_answer)
      normalized_correct   = normalize(@task.correct_answer)

      {
        correct: normalized_submitted == normalized_correct,
        submitted_answer: @submitted_answer,
        correct_answer: @task.correct_answer
      }
    end

    private

    def normalize(value)
      value.to_s.strip.downcase.gsub(",", ".")
    end
  end
end
