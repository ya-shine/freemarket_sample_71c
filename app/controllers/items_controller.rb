class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]

  def index
  end

  def new
    @item = Item.new
    @item.images.new
    @parents = Category.all.order("id ASC")
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name,:description,:price,:category_id,:condition_id,:delivery_fee_id,:size_id,:shipping_method_id,:ship_from_area_id,:shipping_day_id,images_attributes: [:image]).merge(user_id: current_user.id)
  end
  
  # def set_item
  #   @item = Item.find(params[:id])
  # end

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end
  
end