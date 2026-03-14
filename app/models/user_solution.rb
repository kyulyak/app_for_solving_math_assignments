class UserSolution < ApplicationRecord
  belongs_to :user
  belongs_to :problem

  validates :submitted_answer, presence: true, unless: :shown_solution?
  validates :is_correct, inclusion: { in: [ true, false ] }
end
