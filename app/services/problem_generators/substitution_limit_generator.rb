module ProblemGenerators
  class SubstitutionLimitGenerator < BaseGenerator
    include MathFormatting

    def call
      a = rand(1..5)
      b = rand(1..5)
      c = rand(1..5)
      d = rand(1..5)
      point = rand(1..4)

      numerator = a * point + b
      denominator = c * point + d

      while denominator == 0
        c = rand(1..5)
        d = rand(1..5)
        denominator = c * point + d
      end

      value = numerator.to_f / denominator
      formatted_value = format_number(value)

      expression = "\\frac{#{term(a, "x", 1)} + #{b}}{#{term(c, "x", 1)} + #{d}}"

      content = "Найдите предел: #{math("\\lim_{x \\to #{point}} #{expression}")}"

      solution = "Подставляем #{math("x = #{point}")}, так как знаменатель не обращается в ноль. " \
                 "#{math("\\frac{#{a} \\cdot #{point} + #{b}}{#{c} \\cdot #{point} + #{d}} = #{formatted_value}")}."

      {
        content: content,
        correct_answer: formatted_value,
        solution: solution
      }
    end

    private

    def format_number(value)
      value == value.to_i ? value.to_i.to_s : value.round(2).to_s
    end
  end
end
