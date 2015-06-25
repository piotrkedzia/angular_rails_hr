class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :description
      t.float :discount
      t.float :profit
      t.date :confirmed_date
      t.date :completion_date
      t.string :status
      t.float :tax
      t.references :user, index: true
      t.references :customer, index: true

      t.timestamps
    end
  end
end
