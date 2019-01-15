class Plant < ApplicationRecord
  has_attachments :photos, maximum: 5
  monetize :price_cents, as: "prezzo"
  scope :sort_by_created, -> { order("created_at DESC") }
end
