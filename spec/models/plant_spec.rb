require 'rails_helper'

RSpec.describe Plant, type: :model do
  subject { Plant.new(name: "Achillea", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", category: "erbacee perenni", esposizione: "sole", fioritura: "estate", altezza: "media", terreno: "secco", vaso: "12cm", disponibile: "true", novità: "true", utile_per: "farfalle", price_cents: "500", nascondi: "false")}

  before { subject.save }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "name should be present" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "default price currency should be EUR" do
    expect(subject.price_currency).to eq("EUR")
  end

  it "prezzo should be transformed to full euros, not cents" do
    expect(subject.prezzo).to eq(Money.from_cents(subject.price_cents, "EUR"))
  end
end

