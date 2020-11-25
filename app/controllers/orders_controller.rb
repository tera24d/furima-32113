class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:edit]

  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      @item_purchaser = Item.find(params[:item_id])
      @item_purchaser.update( purchaser: current_user.id )
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    unless current_user.id == @item.user.id || @item.purchaser.present?
      redirect_to action: :index 
    end
end
