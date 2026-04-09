class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  enum :role, { student: 0, admin: 1 }, default: :student

  has_many :attempts, dependent: :destroy
  has_many :solved_problems, through: :attempts, source: :problem
  has_many :favorites, dependent: :destroy
  has_many :favorite_problems, through: :favorites, source: :problem

  # validates :first_name, :last_name, presence: true

  def progress_by_topic(topic_id)
    total = Problem.where(topic_id: topic_id).count
    solved = attempts.joins(:problem)
                     .where(problems: { topic_id: topic_id }, is_correct: true)
                     .select(:problem_id)
                     .distinct
                     .count

    return 0 if total.zero?
    (solved.to_f / total * 100).round(2)
  end
end
