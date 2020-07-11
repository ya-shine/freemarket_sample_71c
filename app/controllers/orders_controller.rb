class OrdersController < ApplicationController
  before_action :set_item
  require "payjp"


  def new
    if @item.item_status == false
    @order = Order.new
    @buyer = User.find_by(id: current_user.id)
    @card = CreditCard.find_by(user_id: current_user.id)
      unless @card.nil?
        Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @card_brand = @default_card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "logo_visa.gif"
      when "JCB"
        @card_src = "jcb-logomark-img-02.gif"
      when "MasterCard"
        @card_src = "logo_mastercard.gif"
      when "Diners Club"
        @card_src = "diners-logomark-img-01.gif"
      when "Discover"
        @card_src = "discover-logomark-img-08.gif"
      end
      end
    else
      redirect_to item_path(@item.id)
    end
  end

  def create
    @order = Order.new(order_params)
    if @item.item_status == false
      card = CreditCard.find_by(user_id: current_user.id)
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      Payjp::Charge.create(
        amount: @item.price,
        customer: card.customer_id,
        currency: 'jpy',
      )
      @item.update(item_status: true)
      redirect_back(fallback_location: new_item_order_path(@item.id)) unless @order.save
    else
      redirect_back(fallback_location: new_item_order_path(@item.id))
    end
  end

  private
  def order_params
    params.require(:order).permit(:seller_id,:buyer_id,:item_id,:zipcode,:prefecture,:city,:address,:building,:receiver_last_name,:receiver_first_name)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
