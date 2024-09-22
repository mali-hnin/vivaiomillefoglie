class AddVenditaOnlineToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :vendita_online, :boolean
  end
end
