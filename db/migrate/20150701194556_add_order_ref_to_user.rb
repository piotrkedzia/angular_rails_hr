class AddOrderRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :order, index: true
  end
end
