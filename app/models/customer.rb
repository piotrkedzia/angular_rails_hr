class Customer < ActiveRecord::Base
  has_many :orders

  VALID_PHONE_NUMBER_REGEX = %r{\A[+]?\d+(?>[- .]\d+)*\z}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, :last_name, :email, :address, :zip_code, presence: true
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }, allow_nil: true
  validates :email, format:  { with: VALID_EMAIL_REGEX, message: 'must be valid' }
  validates :phone_number, :fax_number, format: { with: VALID_PHONE_NUMBER_REGEX, message: 'must be valid' }, allow_blank: true
  validates :city, presence: true
end
