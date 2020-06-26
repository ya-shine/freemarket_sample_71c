require 'rails_helper'

describe Item do
  describe '#create' do

    before do
      @user = create(:user)
    end

    it 'id, name, description, category, size, brand, condition, delivery_fee, shipping_method, ship_from_area, shipping_day, price, user, imageがあれば登録できること' do
      item = build(:item)
      expect(item).to be_valid
    end

  end
end
