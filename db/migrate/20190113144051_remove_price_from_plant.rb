class RemovePriceFromPlant < ActiveRecord::Migration[5.2]
  def change
    remove_monetize :plants, :price
  end
end
