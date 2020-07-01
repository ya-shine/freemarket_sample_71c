class ShopsController < ApplicationController
  def index
    @brands = Brand.all
    @category_parents = Category.where(ancestry: nil)
    @items = Item.all.where(item_status:0).order("created_at DESC").limit(3)
  end
end
