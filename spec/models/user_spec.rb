require 'rails_helper'

describe User do
  describe '#create' do

    it "nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birth_dayが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
    
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "重複したemailが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "@のないemailの場合は登録できないこと" do
      user = build(:user, email: "kkkgmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "ドメインのないemailの場合は登録できないこと" do
      user = build(:user, email: "kkk@")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "passwordがない場合は登録できなこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "1q1q1q1", password_confirmation: "1q1q1q1")
      expect(user).to be_valid
    end

    it "passwordが6文字以下であれば登録できないこと" do
      user = build(:user, password: "1q1q1q", password_confirmation: "1q1q1q")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "passwordが数字のみの場合は登録できないこと" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end

    it "passwordが英字のみの場合は登録できないこと" do
      user = build(:user, password: "aaaaaaa", password_confirmation: "aaaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
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

    it "birth_dayがない場合は登録できないこと" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end

  end
end