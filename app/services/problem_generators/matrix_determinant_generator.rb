module ProblemGenerators
  class MatrixDeterminantGenerator < BaseGenerator
    def call
      a = rand(1..6)
      b = rand(1..6)
      c = rand(1..6)
      d = rand(1..6)

      determinant = a * d - b * c

      content = "Найдите определитель матрицы: [[#{a},#{b}],[#{c},#{d}]]"
      solution = "Для матрицы 2x2 определитель вычисляется по формуле ad - bc. " \
                 "#{a} * #{d} - #{b} * #{c} = #{determinant}."

      {
        content: content,
        correct_answer: determinant.to_s,
        solution: solution
      }
    end
  end
end
