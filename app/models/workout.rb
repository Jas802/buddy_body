class Workout < ApplicationRecord
    validates :title, presence: true, message: "Workout must have a title"
    validates :length, presence: true, message: "Enter workout length in minutes"
    validates :description, presence: true, message: "Provide a description for this workout"
    validates :difficulty, presence: true, message: "Provide a difficulty level for this workout"
    belongs_to :trainer
    belongs_to :user
end
