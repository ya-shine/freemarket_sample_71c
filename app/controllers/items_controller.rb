class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, except: [:index, :new, :create]
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]
  def index
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def get_category_children
    category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children　// 子カテゴリの配列（name）
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children　　// 孫カテゴリの配列（name）
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

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name,:description,:price,:category_id,:condition_id,:delivery_fee_id,:size_id,:shipping_method_id,:ship_from_area_id,:shipping_day_id,images_attributes: [:image]).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end
  
end