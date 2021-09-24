class AddDataEventoToVivaioEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :vivaio_events, :data_evento, :datetime
  end
end
