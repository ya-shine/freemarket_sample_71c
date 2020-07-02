class MypageController < ApplicationController

  def index
    @brands = Brand.all
    @category_parents = Category.all.where(ancestry: nil)
  end
  
end
