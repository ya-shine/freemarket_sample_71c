FactoryBot.define do
  factory :order do
    id                   {'1'}
    zipcode              {'998-9909'}
    prefecture           {'Fukuoka'}
    city                 {'Fukuoka'}
    address              {'Fukuoka'}
    building             {'Fukuoka000'}
    reciever_last_name   {'test'}
    reciever_first_name  {'test'}
    item
    user
  end
end
