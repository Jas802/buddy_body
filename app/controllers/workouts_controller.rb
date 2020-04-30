class WorkoutsController < ApplicationController
    def index
      @trainer = Trainer.find_by(id: params[:trainer_id])
      if @trainer
        @workouts = @trainer.workouts # this will load only the trainer's workours
      else
        @workouts = Workout.all #loads all workouts
      end
    end

    def show
        @workout = Workout.find_by(id: params[:id])
      end
    
      def new
        @workout = Workout.new
        @workout.trainer = Trainer.find_by(id: params[:trainer_id])
      end

      def create
        workout = Workout.create(workout_params)
        workout.user = current_user
        workout.trainer = params[:trainer_id]
        if workout.save
          redirect_to workout_path(@workout)
        else
        redirect_to new_workout_path
        end
      end

      def update
        workout = Workout.find_by(id: params[:id])
        workout.update(workout_params)
        redirect_to workout_path(workout)
      end

      def destroy
        Workout.find(params[:id]).destroy
        redirect_to workouts_path
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