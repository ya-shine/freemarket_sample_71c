class BrandsController < ApplicationController
  before_action :brand_category_header

  def index
    @items = Item.all.where(item_status: false).where.not(brand_id: nil).order("id DESC").page(params[:page]).per(50)
  end
  def show
    @brand = Brand.find(params[:id])
    @items = Item.where(brand_id: @brand.id)
  end

  private

  def brand_category_header
    @category_parents = Category.all.where(ancestry: nil)
    @brands = Brand.all
  end
end
