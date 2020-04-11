class WorkoutsController < ApplicationController
    def index
      @trainer = Trainer.find_by(id: params[:trainer_id])
      if @trainer
        @workouts = @trainer.workouts #loads only this trainer's workouts
      else
        @workout = Workouts.all #loads all workouts
      end
    end

    def show
        @workout = Workout.find_by(id: params[:id])
      end
    
      def new
        @workout = Workout.new
      end

      def create
        workout = Workout.create(workout_params)
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
        :name,
        :description,
        :length,
        :difficulty,
      )
    end
end