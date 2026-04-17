module ProblemGenerators
  class DerivativeProductGenerator < BaseGenerator
    def call
      a = rand(2..9)
      n = rand(2..4)
      b = rand(2..9)
      m = rand(1..3)

      content = "Найдите производную: (#{a}x^#{n}) * (#{b}x^#{m})"

      f = "#{a}x^#{n}"
      g = "#{b}x^#{m}"
      f_prime = derivative_of_power(a, n)
      g_prime = derivative_of_power(b, m)

      correct_coef = a * b * (n + m)
      correct_power = n + m - 1
      correct_answer = build_term(correct_coef, correct_power)

      solution = "Используем правило производной произведения: (f * g)' = f' * g + f * g'. " \
                 "Пусть f = #{f}, тогда f' = #{f_prime}. " \
                 "Пусть g = #{g}, тогда g' = #{g_prime}. " \
                 "После упрощения получаем: #{correct_answer}."

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
      build_term(new_coef, new_power)
    end

    def build_term(coef, power)
      if power == 0
        coef.to_s
      elsif power == 1
        "#{coef}x"
      else
        "#{coef}x^#{power}"
      end
    end
  end
end
