class Trainer < ApplicationRecord
    has_many :workouts
    has_many :users, :through => :workouts

    def self.most_difficult_workouts
        where ('difficulty >= 4')
    end

end
