FactoryBot.define do
  factory :item do
    product            { 'test' }
    explanation        { 'test' }
    category_id        { 3 }
    status_id          { 3 }
    delivery_fee_id    { 3 }
    prefecture_id      { 3 }
    preparation_day_id { 3 }
    price              { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/files/test_image.png'), filename: 'test_image.png')
    end
  end
end
