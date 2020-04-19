class TrainersController < ApplicationController
    def index
        @trainers = Trainer.all
    end

    def show
        @trainer = Trainer.find_by(id: params[:id])
    end

    def new
       @trainer = Trainer.new 
    end
end