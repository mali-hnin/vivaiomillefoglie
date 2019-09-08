class Cart < ApplicationRecord
  as_many :line_items, dependent: :destroy

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
