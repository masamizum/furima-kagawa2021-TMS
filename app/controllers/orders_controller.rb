class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :create]
  before_action :set_item, only:[:index, :create, :pay_item]

  def index
    @order_destination = OrderDestination.new
    if @item.user_id == current_user.id
      redirect_to root_path
    else
      if Order.exists?(item_id: params[:item_id])
        redirect_to root_path
      end
    end
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

end