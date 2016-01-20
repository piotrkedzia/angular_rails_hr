class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  has_many :line_items
  
  def self.recalculate_orders
    self.find_each { |order| order.calculate_total }
  end
  def calculate_total
    self.item_total = line_items_sum
    self.save
  end
  
  def line_items_sum
    line_items.sum("value")
  end
end
