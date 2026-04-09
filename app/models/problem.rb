class Problem < ApplicationRecord
  has_many :attempts, dependent: :destroy
  has_many :favorites, dependent: :destroy

  belongs_to :topic
  belongs_to :subtopic, optional: true

  validates :title, presence: true
  validates :difficulty, inclusion: { in: 1..5 }

  with_options unless: :template_problem? do
    validates :content, :solution, :correct_answer, presence: true
  end

  scope :by_difficulty, ->(level) { where(difficulty: level) }
  scope :easy, -> { where(difficulty: 1..2) }
  scope :medium, -> { where(difficulty: 3) }
  scope :hard, -> { where(difficulty: 4..5) }
  scope :published, -> { where(is_published: true) }

  def solved_by?(user)
    attempts.where(user: user, is_correct: true).exists?
  end

  def template_problem?
    problem_type.present?
  end

  def check_answer(answer)
    normalize_answer(answer) == normalize_answer(correct_answer)
  end

  private

  def normalize_answer(str)
    str.to_s.strip.downcase.gsub(/\s+/, " ")
  end
end
