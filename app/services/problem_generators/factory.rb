module ProblemGenerators
  class Factory
    def self.build(problem)
      case problem.problem_type
      when "derivative_sum"
        DerivativeSumGenerator.new(problem)
      else
        nil
      end
    end
  end
end
