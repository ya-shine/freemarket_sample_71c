FactoryBot.define do
  
  factory :shipping_address do
    last_name       {"山田"}
    first_name      {"太郎"}
    last_name_kana  {"ヤマダ"}
    first_name_kana {"タロウ"}
    zipcode         {"000-0000"}
    prefecture      {"福岡県"}
    city            {"福岡市"}
    address         {"博多区"}
  end

end