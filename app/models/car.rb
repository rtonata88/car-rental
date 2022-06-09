class Car < ApplicationRecord
  has_many :favorites, dependent: :destroy

  validates :name, length: { in: 2..15 }, presence: true
  validates :make, length: { in: 2..15 }, presence: true
  validates :image, presence: true
  validates :model, length: { in: 2..15 }, numericality: { only_integer: true }, presence: true
  validates :description, length: { in: 10..180 }, presence: true
end
