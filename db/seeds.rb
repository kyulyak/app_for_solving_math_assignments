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

subtopic = Subtopic.find_by!(title: "Производная произведения")

subtopic.problems.create!(
  title: "Производная произведения",
  topic: subtopic.topic,
  subtopic: subtopic,
  difficulty: 1,
  problem_type: "derivative_product",
  is_published: true
)

subtopic = Subtopic.find_by!(title: "Производная сложной функции")

subtopic.problems.create!(
  title: "Производная сложной функции",
  topic: subtopic.topic,
  subtopic: subtopic,
  difficulty: 1,
  problem_type: "derivative_composite",
  is_published: true
)
subtopic = Subtopic.find_by!(title: "Определитель матрицы")
subtopic.problems.create!(
  title: "Определитель матрицы",
  topic: subtopic.topic,
  subtopic: subtopic,
  difficulty: 1,
  problem_type: "matrix_determinant",
  is_published: true
)

subtopic = Subtopic.find_by!(title: "Обратная матрица")
subtopic.problems.create!(
  title: "Обратная матрица",
  topic: subtopic.topic,
  subtopic: subtopic,
  difficulty: 1,
  problem_type: "matrix_inverse",
  is_published: true
)

subtopic = Subtopic.find_by!(title: "Сложение матриц")
subtopic.problems.create!(
  title: "Сложение матриц",
  topic: subtopic.topic,
  subtopic: subtopic,
  difficulty: 1,
  problem_type: "matrix_addition",
  is_published: true
)

subtopic = Subtopic.find_by!(title: "Умножение матриц")
subtopic.problems.create!(
  title: "Умножение матриц",
  topic: subtopic.topic,
  subtopic: subtopic,
  difficulty: 1,
  problem_type: "matrix_multiplication",
  is_published: true
)
subtopic = Subtopic.find_by!(title: "Определенные интегралы")
subtopic.problems.create!(
  title: "Определенные интегралы",
  topic: subtopic.topic,
  subtopic: subtopic,
  difficulty: 1,
  problem_type: "definite_integral",
  is_published: true
)

subtopic = Subtopic.find_by!(title: "Неопределенные интегралы")
subtopic.problems.create!(
  title: "Неопределенные интегралы",
  topic: subtopic.topic,
  subtopic: subtopic,
  difficulty: 1,
  problem_type: "indefinite_integral",
  is_published: true
)
subtopic = Subtopic.find_by!(title: "Пределы полиномов")
subtopic.problems.create!(
  title: "Пределы полиномов",
  topic: subtopic.topic,
  subtopic: subtopic,
  difficulty: 1,
  problem_type: "polynomial_limit",
  is_published: true
)

subtopic = Subtopic.find_by!(title: "Подстановка")
subtopic.problems.create!(
  title: "Подстановка",
  topic: subtopic.topic,
  subtopic: subtopic,
  difficulty: 1,
  problem_type: "substitution_limit",
  is_published: true
)
