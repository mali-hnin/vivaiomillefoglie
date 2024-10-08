# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  subject do
    cart = Cart.create
    described_class.new(
      cart_id: cart.id,
      name: 'Jane Doe',
      address: 'aaa',
      phone: 0o00000000000,
      cf: 7_689_543_456_789,
      citta: 'Roma',
      cap: 40_987,
      email: 'miao@miao.com',
      email_confirmation: 'miao@miao.com',
      metodo_pagamento: 'Satuspay',
      periodo_spedizione: 'ottobre'
    )
  end

  describe 'Associations' do
    it { should belong_to(:cart) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:cf) }
    it { should validate_presence_of(:citta) }
    it { should validate_presence_of(:cap) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:email_confirmation) }
    it { should validate_presence_of(:metodo_pagamento) }
    it { should validate_presence_of(:periodo_spedizione) }
    it { should validate_confirmation_of(:email) }
    it { should validate_acceptance_of(:trattamento_dati) }
    it { should validate_acceptance_of(:condizioni_di_vendita) }
  end
end
