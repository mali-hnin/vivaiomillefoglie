class AddOrderToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order, :string
  end
end
