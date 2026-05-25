module Trainer
  class AnswerChecker
    EPSILON = 0.0001

    def initialize(task:, submitted_answer:)
      @task = task
      @submitted_answer = submitted_answer
    end

    def call
      correct = mathematically_equal?(
        @submitted_answer,
        @task.correct_answer
      )

      {
        correct: correct,
        submitted_answer: @submitted_answer,
        correct_answer: @task.correct_answer
      }
    end

    private

    def mathematically_equal?(submitted, correct)
      x_values = [ 1, 2, 3, 5 ]

      x_values.all? do |x|
        submitted_value = evaluate(submitted, x)
        correct_value   = evaluate(correct, x)

        (submitted_value - correct_value).abs < EPSILON
      end
    rescue
      false
    end

    def evaluate(expression, x)
      calculator = Dentaku::Calculator.new

      normalized = normalize(expression)

      calculator.evaluate(normalized, x: x)
    end

    def normalize(value)
      value.to_s
           .downcase
           .gsub(",", ".")
           .gsub("^", "**")
           .gsub(/(\d)(x)/, '\1*\2')
           .gsub(/(\))(\d|x)/, '\1*\2')
           .gsub(/(x)(\d)/, '\1*\2')
    end
  end
end
