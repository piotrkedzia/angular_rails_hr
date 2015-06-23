class ProductSerializer < ActiveModel::Serializer
  attributes :profit, :name, :price, :description
end
