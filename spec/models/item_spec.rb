require 'rails_helper'

describe Item do
  describe '#create' do

    it 'name,description,price,condition_id,delivery_fee_id,shipping_method_id,ship_from_area_id,shipping_day_id,category_id,brand_id,size_id,user_id,imagesが存在すれば登録できること' do
      user = create(:user)
      category = create(:category)
      size = build(:size)
      ship_from_area = build(:ship_from_area)
      delivery_fee = build(:delivery_fee)
      shipping_day = build(:shipping_day)
      shipping_method = build(:shipping_method)
      condition = build(:condition)
      brand = build(:brand)
      image = build(:image)
      item = build(:item,condition_id: condition.id,delivery_fee_id: delivery_fee.id,shipping_day_id:shipping_day.id,shipping_method_id:shipping_method.id,user_id: user.id,ship_from_area_id: ship_from_area.id, category_id:category.id, size_id: size.id,brand_id:brand.id)
      expect(item).to be_valid
    end

    it 'nameがない場合は登録できないこと' do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it 'nameが40文字以上の場合は登録できないこと' do
      item = build(:item, name: "a" * 41)
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    it 'nameが40文字以下の場合は登録できること' do
      item = build(:item, name: 'a'* 40)
      item.valid?
    end

    it 'descriptionがない場合は登録できないこと' do
      item = build(:item, description: nil)
      item.valid? 
      expect(item.errors[:description]).to include("を入力してください")
    end

    it 'descriptionが1000文字以上の場合は登録できないこと' do
      item = build(:item, description: 'a' * 1001)
      item.valid? 
      expect(item.errors[:description]).to include("は1000文字以内で入力してください")
    end

    it 'descriptionが1000文字以下の場合は登録できること' do
      item = build(:item, description: 'a' * 1000)
      item.valid?
    end

    it 'priceがない場合は登録できないこと' do
      item = build(:item, price: nil)
      item.valid? 
      expect(item.errors[:price]).to include("を入力してください")
    end

    it 'priceが300以上9999999以下の場合は登録できること' do
      item = build(:item, price: 67777)
      item.valid? 
    end

    it 'priceが300以下の場合は登録できないこと' do
      item = build(:item, price: 299)
      item.valid? 
      expect(item.errors[:price]).to include()
    end

    it 'priceが10000000以上の場合は登録できないこと' do
      item = build(:item, price: 10000000)
      item.valid? 
      expect(item.errors[:price]).to include()
    end

    it 'condition_idがない場合は登録できないこと' do
      item = build(:item, condition_id: nil)
      item.valid? 
      expect(item.errors[:condition_id]).to include("を入力してください")
    end

    it 'delivery_fee_idがない場合は登録できないこと' do
      item = build(:item, delivery_fee_id: nil)
      item.valid? 
      expect(item.errors[:delivery_fee_id]).to include("を入力してください")
    end

    it 'shipping_method_idがない場合は登録できないこと' do
      item = build(:item, shipping_method_id: nil)
      item.valid? 
      expect(item.errors[:shipping_method_id]).to include("を入力してください")
    end

    it 'ship_from_area_idがない場合は登録できないこと' do
      item = build(:item, ship_from_area_id: nil)
      item.valid? 
      expect(item.errors[:ship_from_area_id]).to include("を入力してください")
    end

    it 'shipping_day_idがない場合は登録できないこと' do
      item = build(:item, shipping_day_id: nil)
      item.valid? 
      expect(item.errors[:shipping_day_id]).to include("を入力してください")
    end

    it 'category_idがない場合は登録できないこと' do
      category = create(:category)
      item = build(:item, category_id: nil)
      item.valid? 
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it 'size_idがない場合は登録できないこと' do
      item = build(:item, size_id: nil)
      item.valid? 
      expect(item.errors[:size_id]).to include()
    end

    it 'user_idがない場合は登録できないこと' do
      item = build(:item, user_id: nil)
      item.valid? 
      expect(item.errors[:user_id]).to include()
    end

    it 'imageがない場合は登録できないこと'  do
      image = build(:image)
      item = build(:item, image_ids:nil)
      item.valid? 
      expect(item.errors[:image]).to include()
    end
  end
end
