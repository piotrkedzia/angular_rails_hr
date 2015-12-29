object @order
attribute :id, :description, :discount, :status, :profit, :confirmed_date, :completion_date, :tax, :item_total

child :customer do
  attribute :id, :first_name, :last_name
end

child :user do
  attribute :id, :email
end
