class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :category_all, only: [:index, :show]
  before_action :brand_category_header, only: [:index, :show, :search, :detail_search]
  before_action :set_detail_search, only: [:index, :detail_search]

  def index
    @items = Item.includes(:user, :likes, :images).where(item_status:false).order("id DESC").page(params[:page]).per(50)
  end

  def new
    @item = Item.new
    @item.images.new
    @parents = Category.includes(:item).order("id ASC")
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

  def edit
    grandchild_category = @item.category
    child_category = grandchild_category.parent


    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  end

  def update
    unless @item.update(item_update_params)
      flash.now[:alert] = "更新できませんでした"
      grandchild_category = @item.category
      child_category = grandchild_category.parent

      @category_parent_array = Category.where(ancestry: nil).pluck(:name)

      @category_children_array = []
      Category.where(ancestry: child_category.ancestry).each do |children|
        @category_children_array << children
      end

      @category_grandchildren_array = []
      Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
        @category_grandchildren_array << grandchildren
      end

      render :edit
    end
  end

  def show
    @items = Item.includes(:user).where(users: {id: @item.user_id},item_status:false)
    @categories = Item.includes(:category).where(categories: {id: @item.category_id})
    @comment = Comment.new
    @comments = @item.comments.order(created_at: :desc)
  end

  def destroy
    if @item.destroy
      redirect_to items_path
    else
      flash.now[:alert] = "削除できませんでした"
      render :show
    end
  end

  def search
    @search = params[:search]
    if @search == ''
      redirect_to items_path
    else
      @items = Item.search(params[:search])
    end
  end

  def detail_search
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :brand_id, :size_id, :condition_id, :delivery_fee_id, :shipping_method_id, :ship_from_area_id, :shipping_day_id, :item_status, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def item_update_params
    params.require(:item).permit(:id, :name, :description, :price, :category_id, :brand_id, :size_id, :condition_id, :delivery_fee_id, :shipping_method_id, :ship_from_area_id, :shipping_day_id, :item_status, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def detail_search_params
    params.require(:q).permit(:sorts, :price_gteq, :price_lteq, condition_id_in: [], delivery_fee_id_in: [])
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def brand_category_header
    @category_parents = Category.where(ancestry: nil)
    @brands = Brand.all
  end

  def category_all
    @item_category_lady = Item.includes(:category).where(item_status:0,category_id:1..199).limit(10)
    @item_category_mens = Item.includes(:category).where(item_status:0,category_id:200..345).limit(10)
    @item_category_hobby = Item.includes(:category).where(item_status:0,category_id:685..797).limit(10)
    @item_category_gadget = Item.includes(:category).where(item_status:0,category_id:898..983).limit(10)
  end

  def set_detail_search
    @q = Item.ransack(params[:q])
    @search_items = @q.result.includes(:user, :likes, :images)
  end
  
end