FactoryBot.define do
  factory :user_order do
    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    city           { '十和田市' }
    addresses      { '奥瀬60' }
    building       { '昭和ビル203' }
    phone_number   { '09012345678' } 
    token          { "tok_8fc309fc2a4f368cbfbfcd65cb8a"}
  end
end
