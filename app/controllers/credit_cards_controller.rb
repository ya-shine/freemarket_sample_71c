class CreditCardsController < ApplicationController
  require "payjp"
  before_action :brand_category_header, only: [:index,:new]
  def index
  end

  def new
    card = CreditCard.where(user_id: current_user.id)
    redirect_to root_path if card.exists?
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card),
      if @card.save
        redirect_to action: "show"
      else
        redirect_to root_path
      end
    end
  end

  def show
  end

  private

  def brand_category_header
    @category_parents = Category.where(ancestry: nil)
    @brands = Brand.all
  end
end
