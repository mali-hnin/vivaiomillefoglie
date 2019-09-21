class AddOrdersToCarts < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :cart, index: true
    add_foreign_key :orders, :carts
  end
end
