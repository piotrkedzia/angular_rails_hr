class Customer < ActiveRecord::Base
  has_many :orders

  VALID_PHONE_NUMBER_REGEX = /\A[+]?\d+(?>[- .]\d+)*\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name,
            :last_name,
            :email,
            :address,
            :zip_code,
            :city,
            presence: true

  validates :discount,
            allow_nil: true,
            numericality: {
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 1
            }

  validates :email,
            format: { with: VALID_EMAIL_REGEX, message: 'must be valid' }

  validates :phone_number,
            :fax_number,
            allow_blank: true,
            format: { with: VALID_PHONE_NUMBER_REGEX, message: 'must be valid' }
end
