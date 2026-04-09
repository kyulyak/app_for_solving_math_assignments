module Trainer
  class GeneratedAnswerChecker
    def initialize(correct_answer:, submitted_answer:)
      @correct_answer = correct_answer
      @submitted_answer = submitted_answer
    end

    def call
      {
        correct: normalize(@submitted_answer) == normalize(@correct_answer),
        submitted_answer: @submitted_answer,
        correct_answer: @correct_answer
      }
    end

    private

    def normalize(value)
      value.to_s
           .strip
           .downcase
           .gsub(/\s+/, "")
           .gsub(",", ".")
    end
  end
end
