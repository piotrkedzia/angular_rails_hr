class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :profit, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 3 }, allow_nil: false
  validates :price, numericality: { greater_than_or_equal_to: 0}, allow_nil: false
  validates :image_url, format: {with: /\.(png|jpg)\Z/i}
end
