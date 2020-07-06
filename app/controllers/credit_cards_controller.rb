class CreditCardsController < ApplicationController
  require "payjp"
  before_action :brand_category_header, only: [:index,:new,:show]
  def index
    card = CreditCard.where(user_id: current_user.id)
    redirect_to credit_card_path(current_user.id) if card.exists?
  end

  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(user_id: current_user.id,customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to root_path
      else
        redirect_to root_path
      end
    end
  end

  def show
    card = CreditCard.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  private

  def brand_category_header
    @category_parents = Category.where(ancestry: nil)
    @brands = Brand.all
  end
end
