module ProblemGenerators
  class IndefiniteIntegralGenerator < BaseGenerator
    def call
      a = rand(2..6)
      n = rand(1..4)

      content = "Найдите неопределенный интеграл: ∫ #{a}x^#{n} dx"

      new_power = n + 1
      new_coef = "#{a}/#{new_power}"

      integral =
        if new_power == 1
          "#{new_coef}x"
        else
          "#{new_coef}x^#{new_power}"
        end

      correct_answer = "#{integral} + C"
      solution = "Используем формулу ∫ x^n dx = x^(n+1)/(n+1) + C. " \
                 "Тогда ∫ #{a}x^#{n} dx = #{a} * x^#{new_power}/#{new_power} + C = #{correct_answer}."

      {
        content: content,
        correct_answer: correct_answer,
        solution: solution
      }
    end
  end
end
