require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET /new" do
    it "responds successfully" do
      get new_cart_order_url(Cart.last.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    cart = Cart.last
    let(:valid_attributes) {
      {#use_route: "carts/#{cart.id}/orders/",
        cart_id: cart.id,
        name: "Cleo Patra",
        address: "pyramids",
        phone: 000000000000,
        cf: "78jhfd754bjkljhg",
        citta: "Cairo",
        cap: 99999,
        email: "cleo@patra.com",
        email_confirmation: "cleo@patra.com",
        metodo_pagamento: "bonifico",
        periodo_spedizione: "novembre",
        order: []}
    }
    it "creates a new order" do
      expect {
        post cart_orders_path(Cart.last.id), params: { order: valid_attributes }
      }.to change { Order.count }.by(1)

    end
  end
end
