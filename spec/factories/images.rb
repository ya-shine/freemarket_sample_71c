FactoryBot.define do
  factory :image do
    id     {'1'}
    # image  {"'app/assets/images/test.jpg'"}
    image  {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}
    created_at  {'2020-01-01'}
    updated_at  {'2020-01-01'}
  end
end
