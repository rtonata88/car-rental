class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :user_id,  numericality: { only_integer: true }
  validates :car_id,  numericality: { only_integer: true }
end
