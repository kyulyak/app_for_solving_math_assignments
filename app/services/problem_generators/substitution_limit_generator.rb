module ProblemGenerators
  class SubstitutionLimitGenerator < BaseGenerator
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

      content = "Найдите предел: lim x->#{point} (#{a}x + #{b}) / (#{c}x + #{d})"
      solution = "Подставляем x = #{point}, так как знаменатель не обращается в ноль. " \
                 "(#{a} * #{point} + #{b}) / (#{c} * #{point} + #{d}) = #{formatted_value}."

      {
        content: content,
        correct_answer: formatted_value,
        solution: solution
      }
    end

    private

    def format_number(value)
      if value == value.to_i
        value.to_i.to_s
      else
        value.round(2).to_s
      end
    end
  end
end
