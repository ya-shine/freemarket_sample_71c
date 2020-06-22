require 'rails_helper'

describe Image do
  describe "#create" do
    
    it 'image,item_idが存在すれば登録できること' do
      user = create(:user)
      category = create(:category)
      size = create(:size)
      ship_from_area = create(:ship_from_area)
      delivery_fee = create(:delivery_fee)
      shipping_day = create(:shipping_day)
      shipping_method = create(:shipping_method)
      condition = create(:condition)
      brand = create(:brand)
      item = build(:item,condition_id: condition.id,delivery_fee_id: delivery_fee.id,shipping_day_id:shipping_day.id,shipping_method_id:shipping_method.id,user_id: user.id,ship_from_area_id: ship_from_area.id, category_id:category.id, size_id: size.id,brand_id:brand.id)
      image = build(:image,item_id:item.id)
      expect(image).to be_valid
    end

    it 'imageが存在しなければ登録できないこと' do
      user = create(:user)
      category = create(:category)
      size = create(:size)
      ship_from_area = create(:ship_from_area)
      delivery_fee = create(:delivery_fee)
      shipping_day = create(:shipping_day)
      shipping_method = create(:shipping_method)
      condition = create(:condition)
      brand = create(:brand)
      item = build(:item,condition_id: condition.id,delivery_fee_id: delivery_fee.id,shipping_day_id:shipping_day.id,shipping_method_id:shipping_method.id,user_id: user.id,ship_from_area_id: ship_from_area.id, category_id:category.id, size_id: size.id,brand_id:brand.id)
      image = build(:image, image: nil)
      expect(image.errors[:image]).to include()
    end
  end
end
