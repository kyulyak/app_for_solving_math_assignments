module ProblemGenerators
  class DerivativeSumGenerator < BaseGenerator
    def call
      a = rand(2..9)
      n = rand(2..4)
      b = rand(2..9)
      m = rand(1..3)

      content = "Найдите производную: #{a}x^#{n} + #{b}x^#{m}"

      first_part  = derivative_of_power(a, n)
      second_part = derivative_of_power(b, m)

      correct_answer = [ first_part, second_part ].join(" + ")
      solution = "Используем правило производной суммы: производная суммы равна сумме производных. " \
                 "d/dx(#{a}x^#{n}) = #{first_part}, d/dx(#{b}x^#{m}) = #{second_part}. " \
                 "Ответ: #{correct_answer}"

      {
        content: content,
        correct_answer: correct_answer,
        solution: solution
      }
    end

    private

    def derivative_of_power(coef, power)
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
