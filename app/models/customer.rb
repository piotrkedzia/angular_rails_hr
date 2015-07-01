class Customer < ActiveRecord::Base
  has_many :orders

  validates :first_name, :last_name, :email, :address, :zip_code, presence: true
  validates :discount, numericality: { less_than: 1 }

end
