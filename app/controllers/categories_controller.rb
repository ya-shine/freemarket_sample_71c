class CategoriesController < ApplicationController

  before_action :brand_category_header

  def index
    @items = Item.includes(:user).where(item_status:0).order("id DESC").page(params[:page]).per(50)
  end
  def show
    @category = Category.find(params[:id])
    @items = @category.find_items
    @items = @items.where(item_status:0).order("created_at DESC").page(params[:page]).per(30)
  end

  private

  def brand_category_header
    @category_parents = Category.where(ancestry: nil)
    @brands = Brand.all
  end
end
