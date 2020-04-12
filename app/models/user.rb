class User < ApplicationRecord
    validates :username, uniqueness: true
    validates :password, length: { in: 6..20 }
    has_secure_password
    has_many :workouts
    has_many :trainers, :through => :workouts

    #def self.from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        #where(email: auth.info.email).first_or_initialize do |user|
        #  user.name = auth.info.name
        #  user.email = auth.info.email
        #end
      #end
end

