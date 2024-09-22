class AddVenditaVivaioToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :vendita_vivaio, :boolean
  end
end
