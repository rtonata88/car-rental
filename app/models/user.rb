class User < ApplicationRecord
  has_secure_password
  has_many :favorites, dependent: :destroy

  validates :username, length: { in: 5..15 }, presence: true
  validates :username, uniqueness:
  { message: 'is already associated with an existing account' }
  validates :password, length: { in: 5..15 }
end
