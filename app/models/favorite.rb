class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :problem

  validates :user_id, uniqueness: { scope: :problem_id }
end
