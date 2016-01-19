FactoryGirl.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
    description { Faker::Lorem.sentence }
    profit { Faker::Number.number(1).to_f / 10 }
    image_url { Faker::Company.logo }
  end
end
