class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :tax_identification_number
      t.string :email
      t.integer :phone_number
      t.integer :fax_number
      t.text :adress
      t.string :zip_code
      t.string :city
      t.string :www
      t.text :note
      t.integer :discount

      t.timestamps
    end
  end
end
