class Car < ApplicationRecord
  has_many :favorites, dependent: :destroy
end
