class GreetingsController < ApplicationController
  before_action :set_greeting, only: [:show, :edit, :update, :destroy]

  def index
    @greetings = Greeting.all
  end

  def show
    #authorize @worker_profile
    #@user = current_user
    #@booking = Booking.new
    #@working_hash = @worker_profile.calculate_availabilities
  end

  def create
    @greeting = Greeting.new(greeting_params)
    @greeting.save
    redirect_to greeting_path(@greeting)
  end

  def update
    @greeting.update(greeting_params)
    redirect_to greeting_path(@greeting)
  end

  def edit
    #authorize @worker_profile
    #@worker_profile_tag = WorkerProfileTag.new
    #@availability = Availability.new
  end

  def destroy
    @greeting.destroy
    redirect_to index_path
  end

  private

  def set_greeting
    @greeting = Greeting.find(params[:id])
  end

  def greeting_params
    params.require(:greeting).permit(:word, :story, :audio)
  end

end
