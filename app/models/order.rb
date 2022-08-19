class Order < ApplicationRecord
  belongs_to :cart

  validates_presence_of :name, :address, :phone, :cf, :citta, :cap,  :email_confirmation, :metodo_pagamento, :periodo_spedizione
  validates :email, confirmation: true, presence: true
  validates_acceptance_of :trattamento_dati, :condizioni_di_vendita
end
