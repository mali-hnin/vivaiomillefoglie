class RemovePhotosFromPlants < ActiveRecord::Migration[7.0]
  def change
    remove_column :plants, :photo, :string
  end
end
