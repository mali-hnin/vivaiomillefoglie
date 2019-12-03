class Order < ApplicationRecord
  belongs_to :cart

  validates :name, :address, :phone, :cf, :citta, :cap,  :email_confirmation, :metodo_pagamento, :periodo_spedizione, presence: {message: "non può essere vuoto."}
  validates :email, confirmation: true, presence: true
  validates :trattamento_dati, :condizioni_di_vendita, acceptance: {message: "deve essere accettato."}
end
