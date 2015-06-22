class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone_number, :adress, :zip_code, :city
end
