class BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: :index
  skip_after_action :verify_authorized, only: [:create]
  
  helper_method :format_price

  def index
    @batches = policy_scope(Batch).order(created_at: :desc)
    @batch = Batch.new
    @purchase = Purchase.all.where(user: current_user)
    @all = Batch.all.where(purchase: @purchase)
    
  end

  def show
    @user = current_user
  end

  def create
    @batch = Batch.new(params.require(:batch).permit(:batch_qty, :purchase_id, :item_id))
    @batch.save
    #redirect_to greeting_path(@greeting)
  end

  def update
    @batch.update(batch_params)
    redirect_to batch_path(@batch)
  end

  def edit
  end

  def destroy
    @batch = Batch.find_by(id: params[:id])
    @batch.destroy
    authorize @batch
    redirect_to root_path
  end

  def format_price(number)
    num_groups = number.to_s.chars.to_a.reverse.each_slice(3)
    num_groups.map(&:join).join('.').reverse
  end

  private

  def set_batch
    @batch = Batch.find(params[:id])
  end

  def batch_params
    params.require(:batch).permit(:batch_qty, :purchase_id, :item_id)
  end

end
