module ProblemGenerators
  class DerivativeSumGenerator < BaseGenerator
    include MathFormatting

    def call
      a = rand(2..9)
      n = rand(2..4)
      b = rand(2..9)
      m = rand(1..3)

      first_term_latex = term(a, "x", n)
      second_term_latex = term(b, "x", m)

      content = "Найдите производную: #{math("#{first_term_latex} + #{second_term_latex}")}"

      first_part = derivative_of_power(a, n)
      second_part = derivative_of_power(b, m)

      first_part_latex = latex_term(a * n, "x", n - 1)
      second_part_latex = latex_term(b * m, "x", m - 1)

      correct_answer = [ first_part, second_part ].join(" + ")

      solution = "Используем правило производной суммы: производная суммы равна сумме производных. " \
                 "#{math("\\frac{d}{dx}\\left(#{first_term_latex}\\right) = #{first_part_latex}")}, " \
                 "#{math("\\frac{d}{dx}\\left(#{second_term_latex}\\right) = #{second_part_latex}")}. " \
                 "Ответ: #{math("#{first_part_latex} + #{second_part_latex}")}"

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

    def latex_term(coef, variable, exponent)
      return coef.to_s if exponent == 0
      return "#{coef}#{variable}" if exponent == 1

      "#{coef}#{variable}^{#{exponent}}"
    end
  end
end
