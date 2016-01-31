class CustomerSerializer < ActiveModel::Serializer
  attributes(
    :id, :first_name, :last_name, :description,
    :tax_identification_number, :email, :phone_number, :fax_number,
    :address, :zip_code, :city, :www, :note, :discount
  )
end
