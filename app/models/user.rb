class User < ApplicationRecord
  has_secure_password
  has_many :favorites, dependent: :destroy

  validates :username, length: { in: 5..15 }, presence: true
  validates :username, uniqueness:
  { message: ':An account associated with this username already exists' }
  validates :password, length: { in: 5..15 }
end
