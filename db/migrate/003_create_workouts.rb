class CreateWorkouts < ActiveRecord::Migration[6.0]
    def change
      create_table :workouts do |t|
        t.string :title
        t.text :description
        t.integer :length
        t.string :difficulty
  
        t.timestamps
      end
    end
  end