class Topic < ApplicationRecord
  has_many :problems, dependent: :destroy
  has_many :reference_materials, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
end
