class VivaioEvent < ApplicationRecord
  has_rich_text :content
  scope :by_event_date, -> { order("data_evento") }
end
