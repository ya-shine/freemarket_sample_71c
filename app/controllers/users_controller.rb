class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @brands = Brand.all
    @category_parents = Category.all.where(ancestry: nil)
  end

  def likes
    @brands = Brand.all
    @category_parents = Category.all.where(ancestry: nil)
  end

end
