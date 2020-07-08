require 'rails_helper'

describe Order do
  describe '#create' do
    
    before do
      @user = create(:user)
      @item = create(:item)
    end

    it 'id,zipcode,prefecture,city,building,user_id,item_id'
  end
end
