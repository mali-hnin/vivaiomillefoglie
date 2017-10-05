class CreatePianta < ActiveRecord::Migration[5.1]
  def change
    create_table :pianta do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
