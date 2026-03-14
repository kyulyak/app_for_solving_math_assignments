class ReferenceMaterial < ApplicationRecord
  belongs_to :topic

  validates :title, presence: true
  validates :content, presence: true
end
