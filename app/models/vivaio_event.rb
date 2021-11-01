class VivaioEvent < ApplicationRecord
  has_rich_text :content
  scope :by_event_date, -> { order("data_evento") }
  scope :future, -> { where("data_evento >= ? OR data_fine_evento >= ? OR data_evento IS NULL = ?", Date.current, Date.current, true) }
  scope :past, -> { where("data_fine_evento < ? OR data_evento < ?", Date.current, Date.current) }
end
