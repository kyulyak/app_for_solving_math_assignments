module ProblemGenerators
  class MatrixInverseGenerator < BaseGenerator
    include MathFormatting

    def call
      matrix, determinant = generate_invertible_matrix

      a = matrix[0][0]
      b = matrix[0][1]
      c = matrix[1][0]
      d = matrix[1][1]

      inverse = [
        [ d, -b ],
        [ -c, a ]
      ]

      content = "Найдите обратную матрицу для: #{math(matrix_to_latex(matrix))}"

      solution = "Для матрицы 2×2 обратная матрица вычисляется по формуле " \
                 "#{math("A^{-1} = \\frac{1}{\\det A}\\begin{pmatrix} d & -b \\\\ -c & a \\end{pmatrix}")}. " \
                 "Определитель: #{math("#{a} \\cdot #{d} - #{b} \\cdot #{c} = #{determinant}")}. " \
                 "Значит, обратная матрица: #{math("\\frac{1}{#{determinant}}#{matrix_to_latex(inverse)}")}."

      {
        content: content,
        correct_answer: "(1/#{determinant})*#{inverse_as_string(inverse)}",
        solution: solution,
        answer_type: "matrix_with_factor",
        matrix_rows: 2,
        matrix_cols: 2
      }
    end

    private

    def generate_invertible_matrix
      loop do
        a = rand(1..5)
        b = rand(1..5)
        c = rand(1..5)
        d = rand(1..5)

        determinant = a * d - b * c
        return [ [ [ a, b ], [ c, d ] ], determinant ] if determinant != 0
      end
    end

    def inverse_as_string(matrix)
      "[[#{matrix[0][0]},#{matrix[0][1]}],[#{matrix[1][0]},#{matrix[1][1]}]]"
    end
  end
end
