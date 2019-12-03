class AddColumnsToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :citta, :string
    add_column :orders, :cap, :string
    add_column :orders, :metodo_pagamento, :string
    add_column :orders, :periodo_spedizione, :string
    add_column :orders, :condizioni_di_vendita, :boolean
    add_column :orders, :trattamento_dati, :boolean
  end
end
