class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren, :get_size]
  before_action :category_all, only: :index
  before_action :brand_category_header, only: [:index]
  def index
    @items = Item.all.where(item_status:0).order("id DESC").page(params[:page]).per(50)
  end

  def new
    @item = Item.new
    @item.images.new
    @parents = Category.all.order("id ASC")
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
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
      @item.images.new
      @category_parent_array = Category.where(ancestry: nil).pluck(:name)
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

  def brand_category_header
    @category_parents = Category.all.where(ancestry: nil)
    @brands = Brand.all
  end

  def category_all
    @item_category_lady = Item.all.where(item_status:0,category_id:1..199).limit(10)
    @item_category_mens = Item.all.where(item_status:0,category_id:200..345).limit(10)
    @item_category_hobby = Item.all.where(item_status:0,category_id:685..797).limit(10)
    @item_category_gadget = Item.all.where(item_status:0,category_id:898..983).limit(10)
  end
  
end