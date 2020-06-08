class ItemsController < ApplicationController

  def index
  end

  def new
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end
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

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  private

  def item_params
    params.require(:item).permit(:name,:description,:price,:condition,:delivery_fee,:ship_from_area,:shipping_method,:shipping_days,:selling_status).merge(user_id: current_user.id)
  end
  
end
