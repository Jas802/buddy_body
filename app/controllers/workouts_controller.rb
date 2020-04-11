class WorkoutsController < ApplicationController
    def index
        @workout = Workouts.all
    end

    def show
        @workout = Workout.find_by(id: params[:id])
      end
    
      def new
        @workout = Workout.new
      end

      def update
        workout = Workout.find_by(id: params[:id])
        workout.update(workout_params)
        redirect_to workout_path(workout)
      end


      private

    def workout_params
      params.require(:workout).permit(
        :name,
        :description,
        :length,
        :difficulty,
      )
    end
end