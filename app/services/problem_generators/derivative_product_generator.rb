module ProblemGenerators
  class DerivativeProductGenerator < BaseGenerator
    include MathFormatting

    def call
      a = rand(2..9)
      n = rand(2..4)
      b = rand(2..9)
      m = rand(1..3)

      f = "#{a}x^#{n}"
      g = "#{b}x^#{m}"

      f_latex = term(a, "x", n)
      g_latex = term(b, "x", m)

      f_prime = derivative_of_power(a, n)
      g_prime = derivative_of_power(b, m)

      f_prime_latex = latex_term(a * n, "x", n - 1)
      g_prime_latex = latex_term(b * m, "x", m - 1)

      correct_coef = a * b * (n + m)
      correct_power = n + m - 1
      correct_answer = "#{math(latex_term(correct_coef, "x", correct_power))}."

      content = "Найдите производную: #{math("\\left(#{f_latex}\\right) \\cdot \\left(#{g_latex}\\right)")}"

      solution = "Используем правило производной произведения: " \
                 "#{math("(f \\cdot g)' = f' \\cdot g + f \\cdot g'")}. " \
                 "Пусть #{math("f = #{f_latex}")}, тогда #{math("f' = #{f_prime_latex}")}. " \
                 "Пусть #{math("g = #{g_latex}")}, тогда #{math("g' = #{g_prime_latex}")}. " \
                 "После упрощения получаем: #{math(latex_term(correct_coef, "x", correct_power))}."

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

    def latex_term(coef, variable, exponent)
      return coef.to_s if exponent == 0
      return "#{coef}#{variable}" if exponent == 1

      "#{coef}#{variable}^{#{exponent}}"
    end
  end
end
