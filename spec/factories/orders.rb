FactoryBot.define do

  factory :order do
    buyer_id             {'1'}
    seller_id            {'2'}
    item
    zipcode              {'998-9909'}
    prefecture           {'Fukuoka'}
    city                 {'Fukuoka'}
    address              {'fukuoka'}
    building             {'Fukuoka000'}
    receiver_last_name   {'test'}
    receiver_first_name  {'test'}
  end

end