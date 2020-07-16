class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @brands = Brand.all
    @category_parents = Category.all.where(ancestry: nil)
  end

  def likes
    @user = current_user
    @brands = Brand.all
    @category_parents = Category.all.where(ancestry: nil)
  end

end
