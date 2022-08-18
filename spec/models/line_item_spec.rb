require 'rails_helper'

RSpec.describe LineItem, type: :model do

  subject {
    plant = Plant.create(name: "Achillea", price_cents: 5000)
    cart = Cart.create
    described_class.new(plant_id: plant.id, cart_id: cart.id, quantity: 1)
  }

  describe "create" do
    it "should be valid with valid attributes" do
      expect(subject).to be_valid
    end
  end
  describe "Associations" do
    it { should belong_to(:plant) }
    it { should belong_to(:cart) }
  end
end
