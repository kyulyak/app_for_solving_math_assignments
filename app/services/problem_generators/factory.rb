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

      when "matrix_determinant"
        MatrixDeterminantGenerator.new(problem)
      when "matrix_inverse"
        MatrixInverseGenerator.new(problem)
      when "matrix_addition"
        MatrixAdditionGenerator.new(problem)
      when "matrix_multiplication"
        MatrixMultiplicationGenerator.new(problem)

      when "definite_integral"
        DefiniteIntegralGenerator.new(problem)
      when "indefinite_integral"
        IndefiniteIntegralGenerator.new(problem)

      when "polynomial_limit"
        PolynomialLimitGenerator.new(problem)
      when "substitution_limit"
        SubstitutionLimitGenerator.new(problem)
      else
        nil
      end
    end
  end
end
