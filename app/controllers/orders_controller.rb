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
    @item = Item.find(params[:item_id])
    card = CreditCard.find_by(user_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      customer: card.customer_id,
      currency: 'jpy',
    )
    @item.update(item_status: 1)
    Order.create(user_id: current_user.id,item_id:@item.id,shipping_address_id:@item.user.shipping_address.id)
    redirect_to done_item_order_path(@item.id)
  end

  def done
    @item = Item.find(params[:item_id])
  end

end
