class User < ApplicationRecord
    validates :username, uniqueness: true
    validates :password, length: { in: 6..20 }
    has_secure_password
    has_many :workouts
    has_many :trainers, :through => :workouts
end
