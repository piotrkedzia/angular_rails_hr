class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :profit, :image_url
end
