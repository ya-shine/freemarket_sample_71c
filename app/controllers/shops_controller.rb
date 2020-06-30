class ShopsController < ApplicationController
  def index
    @category_parents = Category.where(ancestry: nil)
  end
end
