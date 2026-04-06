# content - условие задачи
# correct_answer - правильный ответ
# solution - объяснение
# title - название (например: "Производная суммы") ОБЯЗАТЕЛЬНО ПРОПИСЫВАТЬ!!

require "yaml"

Problem.destroy_all
Subtopic.destroy_all
Topic.destroy_all

derivatives = Topic.create!(title: "Производные")

derivatives.subtopics.create!([
  { title: "Производная суммы" },
  { title: "Производная произведения" },
  { title: "Производная сложной функции" }
])

matrices = Topic.create!(title: "Матрицы")

matrices.subtopics.create!([
  { title: "Определитель матрицы" },
  { title: "Обратная матрица" },
  { title: "Сложение матриц" },
  { title: "Умножение матриц" }
])

integrals = Topic.create!(title: "Интегралы")

integrals.subtopics.create!([
  { title: "Определенные интегралы" },
  { title: "Неопределенные интегралы" }
])

limits = Topic.create!(title: "Пределы")

limits.subtopics.create!([
  { title: "Пределы полиномов" },
  { title: "Подстановка" }
])

data = YAML.load_file(Rails.root.join("db", "problems.yml"))

data.each do |key, problems|
  subtopic_title = case key
  when "derivative_sum" then "Производная суммы"
  when "derivative_product" then "Производная произведения"
  when "derivative_chain" then "Производная сложной функции"
  when "determinant" then "Определитель матрицы"
  when "inverse_matrix" then "Обратная матрица"
  when "matrix_sum" then "Сложение матриц"
  when "matrix_multiplication" then "Умножение матриц"
  when "integral_simple" then "Неопределенные интегралы"
  when "definite_integral" then "Определенные интегралы"
  when "limits" then "Пределы полиномов"
  end

  subtopic = Subtopic.find_by!(title: subtopic_title)

  problems.each do |p|
    subtopic.problems.create!(
      p.merge(
        topic: subtopic.topic,
        solution: p["solution"] || "Решение не указано"
      )
    )
  end
end
