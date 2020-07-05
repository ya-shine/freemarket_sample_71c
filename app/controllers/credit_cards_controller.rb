class CreditCardsController < ApplicationController
  require "payjp"
  before_action :brand_category_header, only: [:index,:new]
  def index
    # card = current_user.credit_card
    # redirect_to action: "show" if card.exists?
  end

  def new
    card = CreditCard.where(user_id: current_user.id)
    # redirect_to action: "show" if card.exists?
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      costomer = Payjp::Customer.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(user_id: current_user.id, costomer_id: costomer.id, card_id: costomer.default_card)
      if @card.save
        redirect_to root_path
      else
        redirect_to root_path
      end
    end
  end

  def show
    card = current_user.credit_cards.first
    if card.present?
      costomer = Payjp::Customer.retrieve(card.costomer_id)
      @default_card_information = costomer.cards.retrieve(card.card_id)
    else
      redirect_to action: "confirmation", id: current_user.id
    end
  end

  private

  def brand_category_header
    @category_parents = Category.where(ancestry: nil)
    @brands = Brand.all
  end
end
