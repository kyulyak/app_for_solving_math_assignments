class Attempt < ApplicationRecord
  belongs_to :user
  belongs_to :problem

  def shown_solution?
    self.shown_solution
  end

  validates :submitted_answer, presence: true, unless: :shown_solution?
  validates :is_correct, inclusion: { in: [ true, false ] }
end
