# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
    Product.create!(
        name: Faker::Commerce.product_name,
        price: Faker::Commerce.price,
        description: Faker::Lorem.sentence,
        profit: Faker::Number.number(1).to_f / 10
    )
end

20.times do
  Customer.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    tax_identification_number: Faker::Company.duns_number,
    email: Faker::Internet.email,
    phone_number: Faker::Number.number(9),
    fax_number: Faker::Number.number(9),
    address: Faker::Address.street_address,
    zip_code: Faker::Address.zip,
    city: Faker::Address.city,
    www: Faker::Company.logo,
    note: Faker::Lorem.sentence,
    discount: Faker::Number.number(1).to_f / 10
  )
end

# Completed/Finished orders
30.times do
  Order.create!(
    description: Faker::Lorem.sentence,
    discount: Faker::Number.number(1).to_f / 10,
    confirmed_date: Faker::Date.forward(43)
  )
end
