class User < ApplicationRecord
    has_many :favorites
    has_many :cars, through: :favorites
end
