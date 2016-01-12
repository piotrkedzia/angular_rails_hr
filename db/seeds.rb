require 'factory_girl'

FactoryGirl.find_definitions


FactoryGirl.create_list(:product, 20)

FactoryGirl.create_list(:customer, 30)

FactoryGirl.create_list(:order_with_line_items, 35)
