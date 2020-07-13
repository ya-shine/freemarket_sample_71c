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

    it 'imageがない場合は登録できないこと'  do
      image = build(:image)
      item = build(:item, image_ids:nil)
      item.valid? 
      expect(item.errors[:image]).to include()
    end

  end

  describe 'edit' do
    before do
      @user = create(:user)
    end
    it 'id, name, description, category, size, brand, condition, delivery_fee, shipping_method, ship_from_area, shipping_day, price, user, imageがあれば更新できること' do
      item = build(:item)
      expect(item).to be_valid
    end

    it 'nameがない場合は更新できないこと' do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it 'nameが40文字以上の場合は更新できないこと' do
      item = build(:item, name: "a" * 41)
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    it 'nameが40文字以下の場合は更新できること' do
      item = build(:item, name: 'a'* 40)
      item.valid?
    end

    it 'descriptionがない場合は更新できないこと' do
      item = build(:item, description: nil)
      item.valid? 
      expect(item.errors[:description]).to include("を入力してください")
    end

    it 'descriptionが1000文字以上の場合は更新できないこと' do
      item = build(:item, description: 'a' * 1001)
      item.valid? 
      expect(item.errors[:description]).to include("は1000文字以内で入力してください")
    end

    it 'descriptionが1000文字以下の場合は更新できること' do
      item = build(:item, description: 'a' * 1000)
      item.valid?
    end

    it 'priceがない場合は更新できないこと' do
      item = build(:item, price: nil)
      item.valid? 
      expect(item.errors[:price]).to include("を入力してください")
    end

    it 'priceが300以上9999999以下の場合は更新できること' do
      item = build(:item, price: 67777)
      item.valid? 
    end

    it 'priceが300以下の場合は更新できないこと' do
      item = build(:item, price: 299)
      item.valid? 
      expect(item.errors[:price]).to include()
    end

    it 'imageがない場合は更新できないこと'  do
      image = build(:image)
      item = build(:item, image_ids:nil)
      item.valid? 
      expect(item.errors[:image]).to include()
    end
  end
end
