class Plant < ApplicationRecord
  has_attachments :photos, maximum: 5
  monetize :price_cents, as: "prezzo"
  scope :alphabetically, -> { order('name ASC') }
  scope :recently_created, -> { order("created_at DESC") }
  scope :recently_updated, -> { order("updated_at DESC") }

  has_many :line_items
  include PgSearch
  pg_search_scope :search_plants, against: [:name, :description, :category, :utile_per], using: { tsearch: { any_word: true } }

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line items present')
      throw :abort
    end
  end
end
