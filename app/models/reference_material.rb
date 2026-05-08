class ReferenceMaterial < ApplicationRecord
  belongs_to :topic
  has_many :notes, dependent: :destroy


  validates :title, presence: true
  validates :content, presence: true
end
