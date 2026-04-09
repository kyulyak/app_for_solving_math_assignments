# content - условие задачи
# correct_answer - правильный ответ
# solution - объяснение
# title - название (например: "Производная суммы") ОБЯЗАТЕЛЬНО ПРОПИСЫВАТЬ!!

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

subtopic = Subtopic.find_by!(title: "Производная суммы")

subtopic.problems.create!(
  title: "Производная суммы",
  topic: subtopic.topic,
  subtopic: subtopic,
  difficulty: 1,
  problem_type: "derivative_sum",
  is_published: true
)
