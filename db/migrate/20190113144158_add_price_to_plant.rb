class AddPriceToPlant < ActiveRecord::Migration[5.2]
  def change
    add_monetize :plants, :price, amount: { null: true, default: nil }
  end
end
