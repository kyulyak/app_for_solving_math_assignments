class User < ApplicationRecord
  has_secure_password

  enum role: { student: 0, admin: 1 }

  has_many :user_solutions, dependent: :destroy
  has_many :solved_problems, through: :user_solutions, source: :problem
  has_many :favorites, dependent: :destroy
  has_many :favorite_problems, through: :favorites, source: :problem

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, presence: true

  def progress_by_topic(topic_id)
    total = Problem.where(topic_id: topic_id).count
    solved = user_solutions.joins(:problem)
                          .where(problems: { topic_id: topic_id }, is_correct: true)
                          .select(:problem_id).distinct.count

    return 0 if total.zero?
    (solved.to_f / total * 100).round(2)
  end
end
