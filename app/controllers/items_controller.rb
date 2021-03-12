class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: :index
  
  helper_method :format_price
  
  def index
    #@items = Item.all
    @items = policy_scope(Item).order(created_at: :desc)
    if params[:query].present?
      @items = Item.search_items(params[:query])
    end
  end

  def show
    @user = current_user
  end


  def update
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def edit
  end


  def format_price(number)
    num_groups = number.to_s.chars.to_a.reverse.each_slice(3)
    num_groups.map(&:join).join('.').reverse
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:qty)
  end


end
