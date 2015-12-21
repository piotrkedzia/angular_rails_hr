FactoryGirl.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone_number { Faker::Number.number(9) }
    address { Faker::Address.street_address }
    zip_code { Faker::Address.zip }
    city { Faker::Address.city }
  end
end
