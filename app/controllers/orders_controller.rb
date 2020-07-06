class OrdersController < ApplicationController
  require "payjp"

  def show
    @item = Item.find(params[:item_id])
    @buyer = User.find_by(id: current_user.id)
    @card = CreditCard.find_by(user_id: current_user.id)
    unless @card.nil?
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    card = CreditCard.find_by(user_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: 1000,
    customer: card.customer_id,
    currency: 'jpy',
  )

  redirect_to root_path, notice:"you got it"
  end

end
