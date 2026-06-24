module Trainer
  class GeneratedAnswerChecker
    EPSILON = 0.0001

    def initialize(correct_answer:, submitted_answer:, problem_type: nil)
      @correct_answer = correct_answer.to_s.strip
      @submitted_answer = submitted_answer.to_s.strip
      @problem_type = problem_type.to_s
    end

    def call
      {
        correct: correct?,
        submitted_answer: @submitted_answer,
        correct_answer: @correct_answer
      }
    end

    private

    def correct?
      case @problem_type
      when "matrix_addition", "matrix_multiplication"
        matrix_equal?
      when "matrix_inverse"
        matrix_with_factor_equal?
      when "matrix_determinant", "definite_integral", "polynomial_limit", "substitution_limit"
        numeric_equal?
      when "indefinite_integral"
        integral_equal?
      else
        expression_equal?
      end
    end

    def numeric_equal?
      submitted = Dentaku::Calculator.new.evaluate!(normalized_math(@submitted_answer))
      correct = Dentaku::Calculator.new.evaluate!(normalized_math(@correct_answer))

      (submitted.to_f - correct.to_f).abs < EPSILON
    rescue
      false
    end

    def expression_equal?
      [ 1, 2, 3, 5 ].all? do |x|
        submitted = Dentaku::Calculator.new.evaluate!(normalized_math(@submitted_answer), x: x)
        correct = Dentaku::Calculator.new.evaluate!(normalized_math(@correct_answer), x: x)

        (submitted.to_f - correct.to_f).abs < EPSILON
      end
    rescue
      false
    end

    def integral_equal?
      submitted_expr = normalize_integral(@submitted_answer)
      correct_expr = normalize_integral(@correct_answer)

      differences = [ 1, 2, 3, 5 ].map do |x|
        submitted = Dentaku::Calculator.new.evaluate!(submitted_expr, x: x)
        correct = Dentaku::Calculator.new.evaluate!(correct_expr, x: x)

        submitted.to_f - correct.to_f
      end

      differences.all? do |difference|
        (difference - differences.first).abs < EPSILON
      end
    rescue
      false
    end

    def matrix_equal?
      normalize_matrix(@submitted_answer) == normalize_matrix(@correct_answer)
    end

    def matrix_with_factor_equal?
      normalize_matrix_with_factor(@submitted_answer) == normalize_matrix_with_factor(@correct_answer)
    end

    def normalized_math(value)
      value.to_s
           .downcase
           .gsub("\\(", "")
           .gsub("\\)", "")
           .gsub("\\left", "")
           .gsub("\\right", "")
           .gsub("\\cdot", "*")
           .gsub("\\,", "")
           .gsub(",", ".")
           .gsub("·", "*")
           .gsub("−", "-")
           .gsub(/[{}]/, "")
           .gsub(/\s+/, "")
           .gsub(/(\d)(x)/, '\1*x')
           .gsub(/x\^2/, "x*x")
           .gsub(/x\^3/, "x*x*x")
           .gsub(/x\^4/, "x*x*x*x")
           .gsub(/x\^5/, "x*x*x*x*x")
    end

    def normalize_matrix(value)
      value.to_s
           .gsub(/\s+/, "")
           .gsub("−", "-")
    end

    def normalize_matrix_with_factor(value)
      value.to_s
           .gsub(/\s+/, "")
           .gsub("−", "-")
           .gsub("(1/", "1/")
           .gsub(")*", "*")
    end

    def normalize_integral(value)
      value.to_s
          .downcase
          .gsub("с", "c") # русская буква с
          .gsub("\\(", "")
          .gsub("\\)", "")
          .gsub("\\left", "")
          .gsub("\\right", "")
          .gsub("\\,", "")
          .gsub("\\cdot", "*")
          .gsub("·", "*")
          .gsub("−", "-")
          .gsub(",", ".")
          .gsub(/\s+/, "")
          .gsub(/([a-z])\^\{(\d+)\}/, '\1^\2')
          .gsub(/\\frac\{([^{}]+)\}\{([^{}]+)\}/, '(\1)/(\2)')
          .gsub(/[{}]/, "")
          .gsub(/\+c$/, "")
          .gsub(/-c$/, "")
          .gsub(/(\d)(x)/, '\1*\2')
          .gsub(/x\^2/, "x*x")
          .gsub(/x\^3/, "x*x*x")
          .gsub(/x\^4/, "x*x*x*x")
          .gsub(/x\^5/, "x*x*x*x*x")
    end
  end
end
