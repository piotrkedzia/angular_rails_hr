class AddDefaulValuesToCustomers < ActiveRecord::Migration
  def up
    change_column :customers, :discount, :float, { :default => 0 }
  end
end
