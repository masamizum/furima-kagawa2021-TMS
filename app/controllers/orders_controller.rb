class OrdersController < ApplicationController
  before_action :move_to_signed_in, except: [:item_index]
  
  def login_required
    if already_logged_in?
      unless Order.exists?(item_id: params[:item_id])
        redirect_to root_path
      else
        @user = User.all
      end
    else
      redirect_to root_path
    end
  end

  def index
    @item = Item.find(params[:item_id])
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
      if @order_destination.save
        redirect_to root_path
      else
        @item = Item.find(params[:item_id])
        reder :index
      end
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end

  def order_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

end