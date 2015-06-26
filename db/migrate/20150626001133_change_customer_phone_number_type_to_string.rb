class ChangeCustomerPhoneNumberTypeToString < ActiveRecord::Migration
  def change
    change_column :customers, :phone_number, :string
    change_column :customers, :fax_number, :string
  end
end
