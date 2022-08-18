require 'rails_helper'

RSpec.describe Cart, type: :model do
  subject { Cart.new() }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
end
