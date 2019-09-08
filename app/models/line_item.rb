class LineItem < ApplicationRecord
  belongs_to :plant
  belongs_to :cart

  def total_price
    plant.prezzo.to_i * quantity.to_i
  end
end
