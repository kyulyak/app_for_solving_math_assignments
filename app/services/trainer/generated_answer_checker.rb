module Trainer
  class GeneratedAnswerChecker
    EPSILON = 0.0001

    def initialize(correct_answer:, submitted_answer:)
      @correct_answer = correct_answer
      @submitted_answer = submitted_answer
    end

    def call
      {
        correct: mathematically_equal?(@submitted_answer, @correct_answer),
        submitted_answer: @submitted_answer,
        correct_answer: @correct_answer
      }
    end

    private

    def mathematically_equal?(submitted, correct)
      x_values = [ 1, 2, 3, 5 ]

      x_values.all? do |x|
        submitted_value = evaluate(submitted, x)
        correct_value = evaluate(correct, x)

        return false if submitted_value.nil? || correct_value.nil?

        (submitted_value - correct_value).abs < EPSILON
      end
    rescue
      false
    end

    def evaluate(expression, x)
      normalized = normalize(expression)

      Rails.logger.info "RAW: #{expression}"
      Rails.logger.info "NORMALIZED: #{normalized}"
      Rails.logger.info "X: #{x}"

      calculator = Dentaku::Calculator.new
      calculator.evaluate!(normalized, x: x)
    end

    def normalize(value)
      value.to_s
       .downcase
       .gsub("\\(", "")
       .gsub("\\)", "")
       .gsub("\\left", "")
       .gsub("\\right", "")
       .gsub("\\cdot", "*")
       .gsub(",", ".")
       .gsub("·", "*")
       .gsub(/[{}]/, "")
       .gsub(".", "")
       .gsub(/\s+/, "")
       .gsub(/(\d)(x)/, '\1*x')
       .gsub(/(\d)(\()/, '\1*\2')
       .gsub(/(x)(\()/, 'x*\2')
       .gsub(/(\))(\d|x|\()/, '\1*\2')
    end
  end
end
