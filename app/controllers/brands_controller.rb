class BrandsController < ApplicationController

  def index
    @category_parents = Category.all.where(ancestry: nil)
    @brands = Brand.all
    @items = Item.all.where(item_status:0).where.not(brand_id: nil).order("id DESC").page(params[:page]).per(50)
  end
  def show
    @category_parents = Category.all.where(ancestry: nil)
    @brands = Brand.all
    @brand = Brand.find(params[:id])
    @items = Item.where(brand_id: @brand.id)
  end
end
