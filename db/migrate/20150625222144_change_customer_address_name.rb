class ChangeCustomerAddressName < ActiveRecord::Migration
  def change
    rename_column :customers, :adress, :address
  end
end
