class Plant < ApplicationRecord
  has_attachments :photos, maximum: 5
  monetize :price_cents, as: "prezzo"
  scope :sort_by_created, -> { order("created_at DESC") }

  has_many :line_items

  private

   def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line items present')
      throw :abort
    end
   end
end
