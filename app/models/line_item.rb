class LineItem < ActiveRecord::Base
  validates :value, :quantity, :product_id, presence: true
  validates :value, numericality: { greater_than: 0 }, allow_nil: true

  belongs_to :product
  belongs_to :order
end
