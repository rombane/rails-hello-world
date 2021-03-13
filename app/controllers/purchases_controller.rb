class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def index
    @purchases = Purchase.all
  end

  def show
    authorize @purchase
    #authorize @worker_profile
    #@user = current_user
    #@booking = Booking.new
    #@working_hash = @worker_profile.calculate_availabilities
  end

  def new
    @purchase = purchase.new
  end

  def create
    @purchase = Purchase.new(params.require(:purchase).permit())
    @purchase.save
    redirect_to purchase_path(@purchase)
  end

  def update
    @purchase.update(purchase_params)
    redirect_to purchase_path(@purchase)
  end

  def edit
  end

  def destroy
    @purchase.destroy
    redirect_to index_path
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:user_id)
  end

end
