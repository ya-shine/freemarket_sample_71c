class ItemsController < ApplicationController

  before_action :set_item, except: [:index, :new, :create]
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
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def get_category_children
    @category_children = Category.find(params[id: parent.id]).children
  end

  private

  def item_params
    params.require(:item).permit(:name,:description,:price,:condition,:delivery_fee,:ship_from_area,:shipping_method,:shipping_days,:selling_status,images_attributes:  [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
end
