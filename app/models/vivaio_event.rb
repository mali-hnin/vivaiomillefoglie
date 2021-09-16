class VivaioEvent < ApplicationRecord
  has_rich_text :content
  scope :by_event_date, -> { order("data_evento") }
  scope :future, -> { where("data_evento >= ? OR data_evento IS NULL = ?", Date.current, true) }
  scope :tbd, -> { where("data_evento IS NULL = ?", true) }
end
