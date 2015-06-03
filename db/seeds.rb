# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Employee.create(name: "MacGyver", email: "test@example.com", ssn: "555-55-5555", salary: 50000)
Employee.create(name: "Calhoun Tubbs", email: "test2@example.com", ssn: "123-45-6789", salary: 60000)
