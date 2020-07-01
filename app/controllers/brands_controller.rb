class BrandsController < ApplicationController

  def index
    @category_parents = Category.all.where(ancestry: nil)
    @brands = Brand.all
  end
  def show
    @category_parents = Category.all.where(ancestry: nil)
    @brands = Brand.all
    @brand = Brand.find(params[:id])
    @items = Item.where(brand_id: @brand.id)
  end
end
