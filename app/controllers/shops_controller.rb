class ShopsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @category_parents = Category.where(ancestry: nil)
    @brands = Brand.all
    @items = Item.includes(:category).where(item_status: false).order("created_at DESC").limit(3)
  end
end
