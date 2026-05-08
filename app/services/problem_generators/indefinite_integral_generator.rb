module ProblemGenerators
  class IndefiniteIntegralGenerator < BaseGenerator
    include MathFormatting

    def call
      a = rand(2..6)
      n = rand(1..4)

      expr = term(a, "x", n)
      content = "Найдите неопределенный интеграл: #{math(integral(expr))}"

      new_power = n + 1
      correct_answer = "#{math("\\frac{#{a}x^{#{new_power}}}{#{new_power}} + C")}"

      solution = "Используем формулу #{math('\\int x^n\\,dx = \\frac{x^{n+1}}{n+1} + C')}. " \
                 "Ответ: #{math("\\frac{#{a}x^{#{new_power}}}{#{new_power}} + C")}"

      {
        content: content,
        correct_answer: correct_answer,
        solution: solution
      }
    end
  end
end
