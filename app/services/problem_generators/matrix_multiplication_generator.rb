module ProblemGenerators
  class MatrixMultiplicationGenerator < BaseGenerator
    include MathFormatting

    def call
      matrix_a = generate_matrix
      matrix_b = generate_matrix

      result = multiply(matrix_a, matrix_b)

      content = "Умножьте матрицы: #{math("#{matrix_to_latex(matrix_a)} \\cdot #{matrix_to_latex(matrix_b)}")}"

      solution = "При умножении матриц каждый элемент новой матрицы вычисляется как сумма произведений элементов строки на элементы столбца. " \
                 "Получаем #{math(matrix_to_latex(result))}."

      {
        content: content,
        correct_answer: matrix_to_string(result),
        solution: solution
      }
    end

    private

    def generate_matrix
      [
        [ rand(1..5), rand(1..5) ],
        [ rand(1..5), rand(1..5) ]
      ]
    end

    def multiply(a, b)
      [
        [
          a[0][0] * b[0][0] + a[0][1] * b[1][0],
          a[0][0] * b[0][1] + a[0][1] * b[1][1]
        ],
        [
          a[1][0] * b[0][0] + a[1][1] * b[1][0],
          a[1][0] * b[0][1] + a[1][1] * b[1][1]
        ]
      ]
    end

    def matrix_to_string(matrix)
      "[[#{matrix[0][0]},#{matrix[0][1]}],[#{matrix[1][0]},#{matrix[1][1]}]]"
    end
  end
end
