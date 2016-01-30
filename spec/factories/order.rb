FactoryGirl.define do
  factory :order do
    customer
    description { Faker::Lorem.sentence }
    discount 0
    profit 0

    factory :order_with_line_items do
      transient do
        line_items_count { rand(1..15) }
      end

      after(:create) do |order, evaluator|
        create_list(:line_item, evaluator.line_items_count, order: order)
      end
    end
  end
end
