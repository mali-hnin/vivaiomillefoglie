class AddHideToPlant < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :nascondi, :boolean
  end
end
