class ProductSerializer < ActiveModel::Serializer
  attributes  :id, :name, :price, :description,:profit
end
