module ProblemGenerators
  class MatrixInverseGenerator < BaseGenerator
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

      content = "Найдите обратную матрицу для: [[#{a},#{b}],[#{c},#{d}]]"
      solution = "Для матрицы 2x2 обратная матрица вычисляется как (1/det) * [[d,-b],[-c,a]]. " \
                 "Определитель: #{a} * #{d} - #{b} * #{c} = #{determinant}. " \
                 "Значит, обратная матрица: (1/#{determinant}) * #{inverse_as_string(inverse)}."

      {
        content: content,
        correct_answer: "(1/#{determinant})*#{inverse_as_string(inverse)}",
        solution: solution
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
