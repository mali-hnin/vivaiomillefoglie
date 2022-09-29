require 'rails_helper'

RSpec.describe "Carts", type: :request do
  describe "GET /show" do
    it "responds successfully" do
      cart = Cart.create!
      get cart_url(cart)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it "creates a new cart record" do
      expect {
        post carts_path
      }.to change{ Cart.count }.by(1)
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested cart" do
      cart = Cart.create!
      allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { cart_id: cart.id } }
      carts_count = Cart.count
      delete cart_path(cart)
      expect(Cart.count).to eq(carts_count - 1)
    end
  end
end
