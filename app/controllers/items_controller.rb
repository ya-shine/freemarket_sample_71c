class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren, :get_size]
  before_action :set_category, only: [:create]
  def index
  end

  def new
    @item = Item.new
    @item.images.new
    @parents = Category.all.order("id ASC")
    @category_parent_array = []
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

  def get_size
    selected_grandchild = Category.find("#{params[:grandchild_id]}")
    if related_size_parent = selected_grandchild.sizes[0]
      @sizes = related_size_parent.children
    else
      selected_child = Category.find("#{params[:grandchild_id]}").parent
      if related_size_parent = selected_child.sizes[0]
          @sizes = related_size_parent.children
      end
    end
  end

  def create
    @item = Item.new(item_params)
    unless @item.save
      flash.now[:alert] = "画像を入力してください"
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name,:description,:price,:category_id,:brand_id,:size_id,:condition_id,:delivery_fee_id,:shipping_method_id,:ship_from_area_id,:shipping_day_id,:item_status,images_attributes: [:image]).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end
  
end