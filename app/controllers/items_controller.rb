class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :image, :category_id, :sales_status_id, :prefecture_id, :shipping_fee_status_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
end
