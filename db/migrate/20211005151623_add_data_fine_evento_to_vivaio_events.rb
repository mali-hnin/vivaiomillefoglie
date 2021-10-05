class AddDataFineEventoToVivaioEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :vivaio_events, :data_fine_evento, :datetime
  end
end
