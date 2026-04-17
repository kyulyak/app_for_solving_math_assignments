module ProblemGenerators
  class PolynomialLimitGenerator < BaseGenerator
    def call
      a = rand(1..4)
      b = rand(1..6)
      c = rand(1..9)
      point = rand(1..5)

      value = a * point**2 + b * point + c

      content = "Найдите предел: lim x->#{point} (#{a}x^2 + #{b}x + #{c})"
      solution = "Полином непрерывен, поэтому предел равен значению функции в точке. " \
                 "#{a} * #{point}^2 + #{b} * #{point} + #{c} = #{value}."

      {
        content: content,
        correct_answer: value.to_s,
        solution: solution
      }
    end
  end
end
