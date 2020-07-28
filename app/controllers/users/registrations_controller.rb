class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @shipping_address = @user.build_shipping_address
    render :new_shipping_address
  end

  def create_shipping_address
    @user = User.new(session["devise.regist_data"]["user"])
    @shipping_address = ShippingAddress.new(shipping_address_params)
    unless @shipping_address.valid?
      flash.now[:alert] = @shipping_address.errors.full_messages
      render :new_shipping_address and return
    end
    @user.build_shipping_address(@shipping_address.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end

  protected

  def shipping_address_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zipcode, :prefecture, :city, :address, :building, :phone_number)
  end

end
