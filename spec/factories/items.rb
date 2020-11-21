FactoryBot.define do
  factory :item do
    name { 'プラモデル' }
    info { '最新型のモビルスーツです。' }
    price { 5000 }
    category_id { 1 }
    sales_status_id { 1 }
    prefecture_id { 1 }
    shipping_fee_status_id { 1 }
    scheduled_delivery_id { 1 }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
