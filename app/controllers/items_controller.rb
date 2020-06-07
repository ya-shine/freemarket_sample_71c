class ItemsController < ApplicationController

  def index
  end

  def new
    @parents = Category.all.order("id ASC").limit(13)
  end

  def show
  end
  
end
