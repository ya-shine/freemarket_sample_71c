class OrdersController < ApplicationController
  require "payjp"

  def new
    @item = Item.find(params[:item_id])
    if @item.item_status == false
    @order = Order.new
    @buyer = User.find_by(id: current_user.id)
    @card = CreditCard.find_by(user_id: current_user.id)
      unless @card.nil?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
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
      else
        redirect_to mypage_index_path
      end
    else
      redirect_to item_path(@item.id)
    end
  end

  def create
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
    if @item.item_status == false
      card = CreditCard.find_by(user_id: current_user.id)
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        customer: card.customer_id,
        currency: 'jpy',
      )
      @item.update(item_status: true)
      if @order.save
        redirect_to done_item_order_path(@item.id)
      else
        redirect_back(fallback_location: new_item_order_path(@item.id))
      end
    else
      redirect_back(fallback_location: new_item_order_path(@item.id))
    end
  end

  def done
    @item = Item.find(params[:item_id])
  end

  private
  def order_params
    params.require(:order).permit(:seller_id,:buyer_id,:item_id,:zipcode,:prefecture,:city,:building,:receiver_last_name,:receiver_first_name)
  end

end
