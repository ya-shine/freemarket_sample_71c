class BrandsController < ApplicationController
  before_action :brand_category_header

  def index
    @items = Item.all.where(item_status: false).where.not(brand_id: nil).order("id DESC").page(params[:page]).per(50)
    @q = Item.ransack(params[:q])
    @search_items = @q.result.includes(:user, :likes, :images)
  end

  def show
    @brand = Brand.find(params[:id])
    @items = Item.where(brand_id: @brand.id)
    @q = Item.ransack(params[:q])
    @search_items = @q.result.includes(:user, :likes, :images)
  end

  def detail_search
    @q = Item.ransack(detail_search_params)
    @search_items = @q.result.includes(:user, :likes, :images)
  end

  private

  def brand_category_header
    @category_parents = Category.all.where(ancestry: nil)
    @brands = Brand.all
  end

  def detail_search_params
    params.require(:q).permit(:sorts)
  end

end
