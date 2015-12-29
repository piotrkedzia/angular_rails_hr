class AddItemTotalToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :item_total, :decimal, precision: 10, scale: 2
  end
end
