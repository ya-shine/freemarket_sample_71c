class CreditCardsController < ApplicationController
  before_action :brand_category_header, only: [:index,:new]

  def index
  end

  def new
  end

  private

  def brand_category_header
    @category_parents = Category.where(ancestry: nil)
    @brands = Brand.all
  end
end
