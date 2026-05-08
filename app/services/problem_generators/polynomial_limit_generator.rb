module ProblemGenerators
  class PolynomialLimitGenerator < BaseGenerator
    include MathFormatting

    def call
      a = rand(1..4)
      b = rand(1..6)
      c = rand(1..9)
      point = rand(1..5)

      value = a * point**2 + b * point + c

      expression = "#{term(a, "x", 2)} + #{term(b, "x", 1)} + #{c}"

      content = "Найдите предел: #{math("\\lim_{x \\to #{point}} \\left(#{expression}\\right)")}"

      solution = "Полином непрерывен, поэтому предел равен значению функции в точке. " \
                 "#{math("#{a} \\cdot #{point}^{2} + #{b} \\cdot #{point} + #{c} = #{value}")}."

      {
        content: content,
        correct_answer: value.to_s,
        solution: solution
      }
    end
  end
end
