class CategoriesController < ApplicationController

  def index
    @brands = Brand.all
    @category_parents = Category.all.where(ancestry: nil)
    @items = Item.all.where(item_status:0).order("id DESC").page(params[:page]).per(50)
  end
  def show
    @brands = Brand.all
    @category_parents = Category.all.where(ancestry: nil)
    @category = Category.find(params[:id])
    @items = @category.find_items
    @items = @items.where(item_status:0).order("created_at DESC").page(params[:page]).per(30)
  end
end
