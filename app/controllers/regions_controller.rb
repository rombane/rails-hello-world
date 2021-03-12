class RegionsController < ApplicationController

  before_action :set_region, only: [:show, :edit, :update, :destroy]

  def index
    @regions = Region.all
    @greetings = Greeting.all
    @contributors = Contributor.all
  end

  def show
    @greetings_slice = Greeting.all.where(region: @region)
    @photos_by_region = []
    @greetings_slice.each do |greet|
        Photo.all.where(greeting: greet).each do |photo|
          @photos_by_region << photo
        end
    end
    #authorize @worker_profile
    #@user = current_user
    #@booking = Booking.new
    #@working_hash = @worker_profile.calculate_availabilities
  end

=begin
   def create
    @region = region.new(region_params)
    @region.save
    redirect_to region_path(@region)
  end

  def update
    @region.update(region_params)
    redirect_to region_path(@region)
  end 


  def edit
    #authorize @worker_profile
    #@worker_profile_tag = WorkerProfileTag.new
    #@availability = Availability.new
  end

  def destroy
    @region.destroy
    redirect_to root_path
  end
=end

  private

  def set_region
    @region = Region.find(params[:id])
  end

  def region_params
    params.require(:region).permit(:username, :email, :password, :bio)
  end

end
