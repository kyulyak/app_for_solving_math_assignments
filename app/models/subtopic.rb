class Subtopic < ApplicationRecord
  belongs_to :topic
  has_many :problems
end
