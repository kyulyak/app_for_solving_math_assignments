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
