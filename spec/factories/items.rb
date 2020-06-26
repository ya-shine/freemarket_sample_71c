FactoryBot.define do
  factory :item do
    id                 {'1'}
    name               {"testitem"}
    description        {"hello world it is test"}
    category
    size
    brand
    condition
    delivery_fee
    shipping_method
    ship_from_area
    shipping_day
    price              {"5000"}
    user

    after(:build) do |item|
      item.images << build(:image, item: item)
    end
  end

  factory :image do
    image              { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test.jpg"), "image/jpg") }
  end

end
