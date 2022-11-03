# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart, type: :model do
  subject do
    described_class.new(id: 1900)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should have_many(:line_items).dependent(:destroy) }
    it { should have_one(:order) }
  end

  it 'adds up line items prices for total bill' do
    plant1 = Plant.create(name: 'Achillea', price_cents: 5000)
    plant2 = Plant.create(name: 'Achillea', price_cents: 6000)
    line_item1 = LineItem.create(plant_id: plant1.id, cart_id: subject.id, quantity: 1)
    line_item2 = LineItem.create(plant_id: plant2.id, cart_id: subject.id, quantity: 1)
    subject.line_items.append(line_item1)
    subject.line_items.append(line_item2)
    expect(subject.total_price).to eq(line_item1.total_price + line_item2.total_price)
  end
end
