class CategoriesController < ApplicationController

  before_action :brand_category_header

  def index
    @items = Item.includes(:user).where(item_status: false).order("id DESC").page(params[:page]).per(50)
    @q = Item.ransack(params[:q])
    @search_items = @q.result.includes(:user, :likes, :images)
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.find_items
    @items = @items.where(item_status: false).order("created_at DESC").page(params[:page]).per(30)
    @q = Item.ransack(params[:q])
    @search_items = @q.result.includes(:user, :likes, :images)
  end

  def detail_search
    @q = Item.ransack(detail_search_params)
    @search_items = @q.result.includes(:user, :likes, :images)
  end

  private

  def brand_category_header
    @category_parents = Category.where(ancestry: nil)
    @brands = Brand.all
  end

  def detail_search_params
    params.require(:q).permit(:sorts)
  end

end
