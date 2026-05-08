module ProblemGenerators
  class DerivativeCompositeGenerator < BaseGenerator
    include MathFormatting

    def call
      a = rand(2..5)
      n = rand(2..3)
      b = rand(1..9)
      m = rand(2..4)

      inner = "#{term(a, "x", n)} + #{b}"
      inner_plain = "#{a}x^#{n} + #{b}"

      inner_derivative = derivative_of_inner(a, n)

      outer_coef = m
      outer_power = m - 1

      outer_part =
        if outer_power == 1
          "#{outer_coef}(#{inner_plain})"
        else
          "#{outer_coef}(#{inner_plain})^#{outer_power}"
        end

      correct_answer = "#{math("#{outer_coef}\\left(#{inner}\\right)^{#{outer_power}} \\cdot #{latex_term(a * n, "x", n - 1)}")}."

      content = "Найдите производную: #{math("\\left(#{inner}\\right)^{#{m}}")}"

      solution = "Используем правило производной сложной функции: " \
                 "#{math("(f(g(x)))' = f'(g(x)) \\cdot g'(x)")}. " \
                 "Внешняя функция: #{math("u^{#{m}}")}, её производная: #{math("#{m}u^{#{m - 1}}")}. " \
                 "Внутренняя функция: #{math(inner)}, её производная: #{math(latex_term(a * n, "x", n - 1))}. " \
                 "Ответ: #{math("#{outer_coef}\\left(#{inner}\\right)^{#{outer_power}} \\cdot #{latex_term(a * n, "x", n - 1)}")}."

      {
        content: content,
        correct_answer: correct_answer,
        solution: solution
      }
    end

    private

    def derivative_of_inner(coef, power)
      new_coef = coef * power
      new_power = power - 1

      if new_power == 0
        new_coef.to_s
      elsif new_power == 1
        "#{new_coef}x"
      else
        "#{new_coef}x^#{new_power}"
      end
    end

    def latex_term(coef, variable, exponent)
      return coef.to_s if exponent == 0
      return "#{coef}#{variable}" if exponent == 1

      "#{coef}#{variable}^{#{exponent}}"
    end
  end
end
