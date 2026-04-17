module ProblemGenerators
  class DerivativeCompositeGenerator < BaseGenerator
    def call
      a = rand(2..5)
      n = rand(2..3)
      b = rand(1..9)
      m = rand(2..4)

      inner = "#{a}x^#{n} + #{b}"
      inner_derivative = derivative_of_inner(a, n)

      outer_coef = m
      outer_power = m - 1

      outer_part =
        if outer_power == 1
          "#{outer_coef}(#{inner})"
        else
          "#{outer_coef}(#{inner})^#{outer_power}"
        end

      correct_answer = "#{outer_part} * #{inner_derivative}"

      content = "Найдите производную: (#{inner})^#{m}"

      solution = "Используем правило производной сложной функции: (f(g(x)))' = f'(g(x)) * g'(x). " \
                 "Внешняя функция: u^#{m}, её производная: #{m}u^#{m - 1}. " \
                 "Внутренняя функция: #{inner}, её производная: #{inner_derivative}. " \
                 "Ответ: #{correct_answer}"

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
  end
end
