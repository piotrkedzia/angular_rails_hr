object @line_item
attribute  :id, :order_id, :notes, :value, :quantity

child :product do
  attribute :id, :name
end

