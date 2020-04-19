class WorkoutsController < ApplicationController
    def index
        @workouts = Workout.all #loads all workouts
    end

    def show
        @workout = Workout.find_by(id: params[:id])
      end
    
      def new
        @workout = Workout.new
      end

      def create
        workout = Workout.create(workout_params)
        workout.user = current_user
        workout.trainer = params[:trainer_id]
        
        redirect_to workout_path(workout)
      end

      def update
        workout = Workout.find_by(id: params[:id])
        workout.update(workout_params)
        redirect_to workout_path(workout)
      end


      private

    def workout_params
      params.require(:workout).permit(
        :title,
        :description,
        :length,
        :difficulty,
      )
    end
end