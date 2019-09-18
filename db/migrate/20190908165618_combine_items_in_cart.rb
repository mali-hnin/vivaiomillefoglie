class CombineItemsInCart < ActiveRecord::Migration[5.2]
  def change
    def up
        Cart.all.each do |cart|
          sums = cart.line_items.group(:plant_id).sum(:quantity)
          sums.each do |plant_id, quantity|
            if quantity > 1
              cart.line_items.where(plant_id: plant_id).delete_all

              item = cart.line_items.build(plant_id: plant_id)
              item.quantity = quantity
              item.save!
            end
          end
        end
      end

      def down
        #split items with a quantity of 1 or more into multiple items
        LineItem.where("quantity>1").each do |line_item|
          line_item.quantity.times do
            LineItem.create(
              cart_id: line_item.cart_id,
              plant_id: line_item.plant_id,
              quantity: 1
            )
          end
          # remove original line item
          line_item.destroy
        end
      end
  end
end
