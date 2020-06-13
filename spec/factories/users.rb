FactoryBot.define do
  
  factory :user do
    nickname              {"フリマ"}
    email                 {"kkk@gmail.com"}
    password              {"1q1q1q1"}
    password_confirmation {"1q1q1q1"}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_day             {"2020-02-02"}
  end
  
end