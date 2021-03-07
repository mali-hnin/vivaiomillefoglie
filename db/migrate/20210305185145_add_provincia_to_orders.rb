class AddProvinciaToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :provincia, :string
  end
end
