class AddCfToOrder < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :cf, :string
  end
end
