require 'rails_helper'

describe ShippingAddress do
  describe '#create' do

    it "last_name,first_name,last_name_kana,first_name_kana,zipcode,prefecture,city,addressが存在すれば登録できること" do
      shipping_address = build(:shipping_address)
      expect(shipping_address).to be_valid
    end
    
    it "last_nameがない場合は登録できないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "last_nameが半角の場合は登録できないこと" do
      user = build(:user, last_name: "aaa")
      user.valid?
      expect(user.errors[:last_name]).to include("は不正な値です")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "first_nameが半角の場合は登録できないこと" do
      user = build(:user, first_name: "aaa")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it "last_name_kanaがない場合は登録できないこと" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    it "last_name_kanaが半角の場合は登録できないこと" do
      user = build(:user, last_name_kana: "aaa")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は不正な値です")
    end

    it "last_name_kanaが全角でもカナでない場合は登録できないこと" do
      user = build(:user, last_name_kana: "山田")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は不正な値です")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "first_name_kanaが半角の場合は登録できないこと" do
      user = build(:user, first_name_kana: "aaa")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "first_name_kanaが全角でもカナでない場合は登録できないこと" do
      user = build(:user, first_name_kana: "山田")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "zipcodeがない場合は登録できないこと" do
      shipping_address = build(:shipping_address, zipcode: nil)
      shipping_address.valid?
      expect(shipping_address.errors[:zipcode]).to include("を入力してください")
    end

    it "prefectureがない場合は登録できないこと" do
      shipping_address = build(:shipping_address, prefecture: nil)
      shipping_address.valid?
      expect(shipping_address.errors[:prefecture]).to include("を入力してください")
    end

    it "addressがない場合は登録できないこと" do
      shipping_address = build(:shipping_address, address: nil)
      shipping_address.valid?
      expect(shipping_address.errors[:address]).to include("を入力してください")
    end

  end
end