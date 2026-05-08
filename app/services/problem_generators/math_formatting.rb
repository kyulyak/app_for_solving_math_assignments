module ProblemGenerators
  module MathFormatting
    def math(value)
      "\\(#{value}\\)"
    end

    def display_math(value)
      "\\[#{value}\\]"
    end

    def power(base, exponent)
      "#{base}^{#{exponent}}"
    end

    def integral(expr, dx = "dx")
      "\\int #{expr}\\, #{dx}"
    end

    def definite_integral(left, right, expr, dx = "dx")
      "\\int_{#{left}}^{#{right}} #{expr}\\, #{dx}"
    end

    def matrix_to_latex(matrix)
      rows = matrix.map { |row| row.join(" & ") }.join(" \\\\ ")
      "\\begin{pmatrix} #{rows} \\end{pmatrix}"
    end

    def term(coef, variable = "x", exponent = nil)
      return coef.to_s if exponent == 0
      return "#{coef}#{variable}" if exponent == 1 || exponent.nil?

      "#{coef}#{variable}^{#{exponent}}"
    end
  end
end
