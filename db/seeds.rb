# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Employee.create(name: "MacGyver", email: "test@example.com", ssn: "555-55-5555", salary: 50000)
Employee.create(name: "Calhoun Tubbs", email: "test2@example.com", ssn: "123-45-6789", salary: 60000)
Employee.create(name: "John Rambo", email: "john@rambo.com", ssn: "232-11-2321", salary: 432000000)

Product.create(name: "Coke", price:1.00, description:"Liquid soda", profit:0.2 )

10.times do
    Product.create!(
        name: Faker::Commerce.product_name,
        price: Faker::Commerce.price,
        description: Faker::Lorem.sentence,
        profit: Faker::Commerce.price
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
    adress: Faker::Address.street_address,
    zip_code: Faker::Address.zip,
    city: Faker::Address.city,
    www: Faker::Company.logo,
    note: Faker::Lorem.sentence,
    discount: Faker::Number.number(2)
  )
end
