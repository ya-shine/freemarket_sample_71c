class ItemsController < ApplicationController

  def index
  end

  def new
    @parents = Category.all.order("id ASC").limit(13)
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:description,:price,:condition,:delivery_fee,:ship_from_area,:shipping_method,:shipping_days,:selling_status).merge(user_id: current_user.id)
  end
  
end
