require 'rails_helper'

RSpec.describe "LineItems", type: :request do
  describe "GET /index" do
    it "returns successful response" do
      get line_items_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    context "when creating line_item for new plant" do
        it "creates a new line_item" do
        new_plant = Plant.create(name: "Bibi", price_cents: "2000")
        count = LineItem.count
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { cart_id: Cart.last.id } }
        post line_items_path, params: { line_item: { plant_id: new_plant.id, cart_id: Cart.last.id } }
        expect(LineItem.count).to eq(count + 1)
      end
    end

    context "when the plant is already in the cart" do
      let(:valid_attributes) {
        { plant_id: Plant.last.id, cart_id: Cart.last.id }
      }
      it "updates line_item.quantity by +1" do
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { cart_id: Cart.last.id } }
        LineItem.create(plant_id: valid_attributes[:plant_id], cart_id: valid_attributes[:cart_id])
        count = LineItem.count
        line_item = LineItem.find_by(plant_id: valid_attributes[:plant_id])
        quantity = line_item.quantity
        post line_items_path, params: { line_item: valid_attributes }
        expect(LineItem.count).to eq(count)
        expect(LineItem.last.quantity).to eq(quantity + 1)
      end
    end

  end
end
