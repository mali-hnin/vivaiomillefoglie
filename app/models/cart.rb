class Cart < ApplicationRecord
  has_many :line_items
  has_many :order
  register_currency :eur

    def add_plant(plant)
      current_item = line_items.find_by(plant_id: plant.id)

      if current_item
        current_item.increment(:quantity)
      else
        current_item = line_items.build(plant_id: plant.id)
      end
      current_item
    end

    def total_price
      line_items.to_a.sum { |item| item.total_price }
    end
end
