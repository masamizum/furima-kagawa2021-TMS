class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only:[:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user != current_user
     redirect_to root_path
    else
      item.destroy
    end
  end

  def edit
    if Order.exists?(item_id: params[:id])
      redirect_to root_path and return
    end
    if @item.user_id != current_user.id
      redirect_to root_path
    else
      render :edit
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
     else
      render :edit
    end
 
  end

  def show
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :category_id, :sales_status_id, :shipping_fee_status_id,
                                 :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

end