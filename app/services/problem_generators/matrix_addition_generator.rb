module ProblemGenerators
  class MatrixAdditionGenerator < BaseGenerator
    include MathFormatting

    def call
      matrix_a = generate_matrix
      matrix_b = generate_matrix

      result = [
        [
          matrix_a[0][0] + matrix_b[0][0],
          matrix_a[0][1] + matrix_b[0][1]
        ],
        [
          matrix_a[1][0] + matrix_b[1][0],
          matrix_a[1][1] + matrix_b[1][1]
        ]
      ]

      content = "Сложите матрицы: #{math("#{matrix_to_latex(matrix_a)} + #{matrix_to_latex(matrix_b)}")}"
      solution = "Складываем соответствующие элементы матриц. Получаем #{math(matrix_to_latex(result))}."

      {
        content: content,
        correct_answer: matrix_to_plain(result),
        solution: solution
      }
    end

    private

    def generate_matrix
      [
        [ rand(1..9), rand(1..9) ],
        [ rand(1..9), rand(1..9) ]
      ]
    end

    def matrix_to_plain(matrix)
      "[[#{matrix[0][0]},#{matrix[0][1]}],[#{matrix[1][0]},#{matrix[1][1]}]]"
    end
  end
end
