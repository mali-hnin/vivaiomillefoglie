class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :photo
      t.text :description
      t.string :category
      t.string :esposizione
      t.string :fioritura
      t.string :altezza
      t.string :terreno
      t.string :densità
      t.string :vaso
      t.boolean :disponibile
      t.boolean :novità
      t.string :utile_per

      t.timestamps
    end
  end
end
