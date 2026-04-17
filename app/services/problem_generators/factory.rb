module ProblemGenerators
  class Factory
    def self.build(problem)
      case problem.problem_type
      when "derivative_sum"
        DerivativeSumGenerator.new(problem)
      when "derivative_product"
        DerivativeProductGenerator.new(problem)
      when "derivative_composite"
        DerivativeCompositeGenerator.new(problem)
      when "lhopital"
        LhopitalGenerator.new(problem)
      else
        nil
      end
    end
  end
end
