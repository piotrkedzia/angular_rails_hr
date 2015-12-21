FactoryGirl.define do
  factory :line_item do
    order
    product
    notes { Faker::Lorem.sentence }
    value { Faker::Number.decimal(2, 3) }
    quantity { Faker::Number.decimal(2) }
  end
end
