class Problem < ApplicationRecord
  belongs_to :topic
  has_many :user_solutions, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, :content, :solution, presence: true
  validates :difficulty, inclusion: { in: 1..5 }

  scope :by_difficulty, ->(level) { where(difficulty: level) }
  scope :easy, -> { where(difficulty: 1..2) }
  scope :medium, -> { where(difficulty: 3) }
  scope :hard, -> { where(difficulty: 4..5) }

  def solved_by?(user)
    user_solutions.where(user: user, is_correct: true).exists?
  end

  def check_answer(answer)
    # Базовая проверка - можно расширить для разных типов задач
    normalize_answer(answer) == normalize_answer(solution)
  end

  private

  def normalize_answer(str)
    str.to_s.strip.downcase.gsub(/\s+/, " ")
  end
end
