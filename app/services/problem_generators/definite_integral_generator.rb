module ProblemGenerators
  class DefiniteIntegralGenerator < BaseGenerator
    include MathFormatting

    def call
      a = rand(1..4)
      n = rand(1..3)
      left = rand(0..2)
      right = rand((left + 1)..4)

      antiderivative_power = n + 1

      value =
        a.to_f * (
          (right**antiderivative_power).to_f / antiderivative_power -
          (left**antiderivative_power).to_f / antiderivative_power
        )

      formatted_value = format_number(value)

      expr = term(a, "x", n)
      content = "Найдите определенный интеграл: #{math(definite_integral(left, right, expr))}"

      solution = "Первообразная: #{math("\\frac{#{a}x^{#{antiderivative_power}}}{#{antiderivative_power}}")}. " \
                 "Ответ: #{formatted_value}."

      {
        content: content,
        correct_answer: formatted_value,
        solution: solution
      }
    end

    private

    def format_number(value)
      value == value.to_i ? value.to_i.to_s : value.round(2).to_s
    end
  end
end
