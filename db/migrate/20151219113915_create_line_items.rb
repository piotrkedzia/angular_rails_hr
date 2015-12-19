class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :order, index: true
      t.references :product, index: true
      t.text :notes
      t.decimal :value, precision: 8, scale: 2
      t.float :quantity,  null: false
      
      t.timestamps
    end
  end
end
