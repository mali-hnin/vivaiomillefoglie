require 'rails_helper'

RSpec.describe Cart, type: :model do
  subject {
    described_class.new(id: 1900)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  describe "Associations" do
    it { should have_many(:line_items).dependent(:destroy) }
    it { should have_one(:order) }

  end

  it "adds up line items prices for total bill" do
    plant1 = Plant.create(id: 22, name: "Achillea", price_cents: 5000)
    plant2 = Plant.create(id: 23, name: "Achillea", price_cents: 6000)
    line_item1 = LineItem.create(plant_id: 22, cart_id: subject.id, quantity: 1)
    line_item2 = LineItem.create(plant_id: 23, cart_id: subject.id, quantity: 1)
    subject.line_items.append(line_item1)
    subject.line_items.append(line_item2)
    expect(subject.total_price).to eq(line_item1.total_price + line_item2.total_price)
  end
end
