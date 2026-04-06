# content	 - условие задачи
# correct_answer -	правильный ответ
# solution -	объяснение
# title	- название (например: "Производная суммы") ОБЯЗАТЕЛЬНО ПРОПИСЫВАТЬ!!
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
subtopic = Subtopic.find_by!(title: "Производная суммы")

subtopic.problems.create!([
  {
    title: "Производная суммы",
    content: "Найдите производную: (x^2 + 3x)",
    correct_answer: "2x + 3",
    solution: "Производная суммы равна сумме производных: 2x + 3",
    difficulty: 1,
    topic: subtopic.topic
  },
  {
    title: "Производная суммы",
    content: "Найдите производную: (x^3 + x)",
    correct_answer: "3x^2 + 1",
    solution: "Применяем правило суммы",
    difficulty: 1,
    topic: subtopic.topic
  }
])
