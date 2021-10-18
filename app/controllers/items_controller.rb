class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
    @category = Category.new
    @sales_status = SalesStatus.new
    @shipping_fee_status = ShippingFeeStatus.new
    @prefecture = Prefecture.new
    @scheduled_delivery = ScheduledDelivery.new
  end

  def create
    @item = Item.create(item_params)



    if @item.save
      return redirect_to root_path
    else
      render :new
    end


  end

  

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

end
