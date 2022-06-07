class Car < ApplicationRecord
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :make, presence: true
  validates :image, presence: true
  validates :model, presence: true
  validates :description, presence: true
end
