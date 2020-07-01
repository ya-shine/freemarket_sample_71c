class CategoriesController < ApplicationController

  def index
    @category_parents = Category.all.where(ancestry: nil)
    @categories = Category.all
  end
  def show
    @category_parents = Category.all.where(ancestry: nil)
    @category = Category.find(params[:id])
    @items = @category.find_items
    @items = @items.order("created_at DESC").page(params[:page]).per(30)
  end
end
