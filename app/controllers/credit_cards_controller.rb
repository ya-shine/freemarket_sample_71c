class CreditCardsController < ApplicationController
  require "payjp"
  before_action :brand_category_header, only: [:index,:new]

  def index
  end

  def new
    card = CreditCard.where(user_id: current_user.id)
    redirect_to credit_card_path(card) if card.exists?
  end

  def show
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to new_credit_card_path
    else
      costomer = Payjp::Costomer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjp-token'],
        metadata:{user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id,customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to credit_card_path(@card.user_id)
      else
        redirect_to "pay"
      end
    end
  end

  private

  def brand_category_header
    @category_parents = Category.where(ancestry: nil)
    @brands = Brand.all
  end
end
