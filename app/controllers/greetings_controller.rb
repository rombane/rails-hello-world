class GreetingsController < ApplicationController
  before_action :set_greeting, only: [:show, :edit, :update, :destroy]

  def index
    @greetings = Greeting.all
    @photos = Photo.all
  end

  def show
    @photos_by_greeting = Photo.all.where(greeting: @greeting)
    #authorize @worker_profile
    #@user = current_user
    #@booking = Booking.new
    #@working_hash = @worker_profile.calculate_availabilities
  end

  def new
    @greeting = Greeting.new
  end

  def create
    @greeting = Greeting.new(params.require(:greeting).permit(:contributor, :word, :story, :audio))
    @greeting.save
    redirect_to greeting_path(@greeting)
  end

  def update
    @greeting.update(greeting_params)
    redirect_to greeting_path(@greeting)
  end

  def edit
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
