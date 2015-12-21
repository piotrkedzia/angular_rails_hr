FactoryGirl.define do
  factory :order do
    customer
    description { Faker::Lorem.sentence }
    discount 0
    profit 0

  end
end
