class ContributorsController < ApplicationController
  before_action :set_contributor, only: [:show, :edit, :update, :destroy]

  def index
    @contributors = Contributor.all
    @greetings = Greeting.all
  end
  

  def show
    
    @greetings_slice = Greeting.all.where(contributor: @contributor)
    #authorize @worker_profile
    #@user = current_user
    #@booking = Booking.new
    #@working_hash = @worker_profile.calculate_availabilities
  end

  def new
    @contributor = Contributor.new
  end

  def create
    @contributor = Contributor.new(contributor_params)
    @contributor.save
    redirect_to contributor_path(@contributor)
  end

  def update
    @contributor.update(contributor_params)
    redirect_to contributor_path(@contributor)
  end

  def edit
    #authorize @worker_profile
    #@worker_profile_tag = WorkerProfileTag.new
    #@availability = Availability.new
  end

  def destroy
    @contributor.destroy
    redirect_to contributors_path
  end

  private

  def set_contributor
    @contributor = Contributor.find(params[:id])
  end

  def contributor_params
    params.require(:contributor).permit(:username, :email, :password, :bio, :profpic)
  end

end
