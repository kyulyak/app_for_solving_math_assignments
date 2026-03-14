# Создаем темы
topics = Topic.create!([
  { title: "Линейная алгебра", description: "Матрицы, определители, системы уравнений", category: "algebra", icon: "matrix" },
  { title: "Математический анализ", description: "Пределы, производные, интегралы", category: "calculus", icon: "function" },
  { title: "Теория вероятностей", description: "Вероятность, комбинаторика, статистика", category: "probability", icon: "dice" },
  { title: "Дифференциальные уравнения", description: "ОДУ, системы ДУ", category: "diffeq", icon: "equation" }
])

# Создаем задачи для линейной алгебры
problems = Problem.create!([
  {
    title: "Сложение матриц",
    content: "Найдите сумму матриц A и B, где A = [[1, 2], [3, 4]], B = [[5, 6], [7, 8]]",
    solution: "[[6, 8], [10, 12]]",
    difficulty: 1,
    topic: topics[0]
  },
  {
    title: "Определитель матрицы 2x2",
    content: "Вычислите определитель матрицы [[2, 3], [1, 4]]",
    solution: "5",
    difficulty: 2,
    topic: topics[0]
  }
])

# Создаем справочные материалы
topics.each do |topic|
  ReferenceMaterial.create!(
    title: "Основы #{topic.title.downcase}",
    content: "Подробный справочный материал по теме #{topic.title}...",
    topic: topic
  )
end

# Создаем тестового пользователя
user = User.create!(
  email: "student@test.com",
  password: "password123",
  password_confirmation: "password123",
  first_name: "Иван",
  last_name: "Петров",
  role: :student
)

puts "Создано #{Topic.count} тем"
puts "Создано #{Problem.count} задач"
puts "Создано #{ReferenceMaterial.count} справочных материалов"
puts "Создан тестовый пользователь: student@test.com / password123"
