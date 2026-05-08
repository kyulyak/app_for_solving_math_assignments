module ProblemGenerators
  class MatrixDeterminantGenerator < BaseGenerator
    include MathFormatting

    def call
      matrix = [
        [ rand(1..6), rand(1..6) ],
        [ rand(1..6), rand(1..6) ]
      ]

      a, b = matrix[0]
      c, d = matrix[1]

      determinant = a * d - b * c

      content = "Найдите определитель матрицы: #{math(matrix_to_latex(matrix))}"

      solution = "Для матрицы 2×2 определитель вычисляется по формуле #{math('ad - bc')}. " \
                 "#{a} * #{d} - #{b} * #{c} = #{determinant}."

      {
        content: content,
        correct_answer: determinant.to_s,
        solution: solution
      }
    end
  end
end
