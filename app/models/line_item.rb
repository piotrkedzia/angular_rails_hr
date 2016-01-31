class LineItem < ActiveRecord::Base
  validates :value, :quantity, :product_id, presence: true
  validates :value, numericality: { greater_than: 0 }, allow_nil: true

  belongs_to :product
  belongs_to :order

  after_commit :recalculate_order
  before_save :calculate_value

  protected

  def recalculate_order
    order.calculate_total
  end

  def pull_price_from_product
    self.price = product.price
  end

  def calculate_value
    pull_price_from_product
    self.value = quantity * price
  end
end
