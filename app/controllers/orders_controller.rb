class OrdersController < ApplicationController
  require "payjp"

  def new
    @order = Order.new
    @item = Item.find(params[:item_id])
    @buyer = User.find_by(id: current_user.id)
    @card = CreditCard.find_by(user_id: current_user.id)
    unless @card.nil?
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
    else
      redirect_to mypage_index_path
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
    Order.new(order_params)
    Order.create(seller_id: @item.user.id,buyer_id: current_user.id,item_id:@item.id,zipcode:current_user.shipping_address.zipcode,prefecture:current_user.shipping_address.prefecture,city:current_user.shipping_address.city,building:current_user.shipping_address.building,receiver_last_name:current_user.shipping_address.last_name,receiver_first_name:current_user.shipping_address.first_name)
    redirect_to done_item_order_path(@item.id)
  end

  def create
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
    card = CreditCard.find_by(user_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      customer: card.customer_id,
      currency: 'jpy',
    )
    @item.update(item_status: 1)
    # Order.new(order_params)
    @order.save!
    redirect_to done_item_order_path(@item.id)
  end

  def done
    @item = Item.find(params[:item_id])
  end

  private
  def order_params
    params.require(:order).permit(:seller_id,:buyer_id,:item_id,:zipcode,:prefecture,:city,:building,:receiver_last_name,:receiver_first_name)
  end

end
