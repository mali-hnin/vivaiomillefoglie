class AddCfToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :cf, :string
  end
end
