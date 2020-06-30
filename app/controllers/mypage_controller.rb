class MypageController < ApplicationController

  def index
    @category_parents = Category.all.where(ancestry: nil)
  end
  
end
