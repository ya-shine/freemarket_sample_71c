require 'rails_helper'

describe Order do
  describe '#create' do
    
    before do
      @item = create(:item)
    end

    it 'zipcode,prefecture,city,address,building,seller_id,buyer_id,item_id,reciever_last_name,receiver_first_nameがあれば登録できること' do
      order = build(:order)
      expect(order).to be_valid
    end

    it 'zipcodeがないと登録できないこと' do
      order = build(:order, zipcode: nil)
      order.valid?
      expect(order.errors[:zipcode]).to include("を入力してください")
    end

    it 'prefectureがないと登録できないこと' do
      order = build(:order, prefecture: nil)
      order.valid?
      expect(order.errors[:prefecture]).to include("を入力してください")
    end

    it 'cityがないと登録できないこと' do
      order = build(:order, city: nil)
      order.valid?
      expect(order.errors[:city]).to include("を入力してください")
    end

    it 'addressがないと登録できないこと' do
      order = build(:order, address: nil)
      order.valid?
      expect(order.errors[:address]).to include("を入力してください")
    end

    it 'receiver_last_nameがないと登録できないこと' do
      order = build(:order, receiver_last_name: nil)
      order.valid?
      expect(order.errors[:receiver_last_name]).to include("を入力してください")
    end

    it 'receiver_first_nameがないと登録できないこと' do
      order = build(:order, receiver_first_name: nil)
      order.valid?
      expect(order.errors[:receiver_first_name]).to include("を入力してください")
    end
  end
end
