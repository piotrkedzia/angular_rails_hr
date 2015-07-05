class Product < ActiveRecord::Base
  validates :profit, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 3 }
end
