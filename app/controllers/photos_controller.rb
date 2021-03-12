class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def show
    
    #@photos_by_photo = Photo.all.where(greeting: @greeting)
    @greeting_by_photo = @photo.greeting
    @contributor_by_photo = @greeting_by_photo.contributor
    #authorize @worker_profile
    #@user = current_user
    #@booking = Booking.new
    #@working_hash = @worker_profile.calculate_availabilities
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save
    redirect_to photo_path(@photo)
  end

  def update
    @photo.update(photo_params)
    redirect_to photo_path(@photo)
  end

  def edit
  end

  def destroy
    @photo.destroy
    redirect_to photos_path
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:description)
  end
end
