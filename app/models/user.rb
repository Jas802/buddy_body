class User < ApplicationRecord
    validates :username, uniqueness: true
    validates :password, length: { in: 6..20 }
    has_secure_password
    has_many :workouts
    has_many :trainers, :through => :workouts

    def add_to_workouts
      self.workouts <<@workout.id
    end

    def self.create_with_omniauth(auth)
        create! do |user|
          user.provider = auth["provider"]
          user.uid = auth["uid"]
          user.name = auth["info"]["name"]
        end
    end
end

