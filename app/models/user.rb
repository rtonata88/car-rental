class User < ApplicationRecord
  has_secure_password
  has_many :favorites, dependent: :destroy

  validates :username, password, presence: true
  validates :username, uniqueness:
  { message: ':An account associated with %{value} already exists' }
  validates :password, length: {in: 5..15}
end
