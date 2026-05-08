class Note < ApplicationRecord
  belongs_to :user
  belongs_to :reference_material, class_name: "Topic"
  validates :content, presence: true
end
