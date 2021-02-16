class Plant < ApplicationRecord
  has_attachments :photos, maximum: 5
  monetize :price_cents, as: "prezzo"
  scope :alphabetically, -> { order('name ASC') }
  scope :recently_created, -> { order("created_at DESC") }
  scope :recently_updated, -> { order("updated_at DESC") }
  scope :is_visible, -> { where(nascondi: false) }
  scope :filter_by_category, -> (category) { where("category ILIKE ?", '%'+ category +'%')}
  scope :filter_by_esposizione, -> (esposizione) { where("esposizione ILIKE ?", esposizione)}
  scope :filter_by_fioritura, -> (fioritura) { where("fioritura ILIKE ?", fioritura)}


  has_many :line_items
  include PgSearch
  pg_search_scope :search_plants, against: [:name, :description, :category, :utile_per], using: { tsearch: { any_word: true } }

  include Filterable

  private

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line items present')
      throw :abort
    end
  end
end

def self.options_for_category
  plants = Plant.arel_table
  order(plants[:category].lower).group_by{|e| e.category}.map(&:first).map(&:titleize)
end

def self.options_for_esposizione
  plants = Plant.arel_table
  order(plants[:esposizione].lower).group_by{|e| e.esposizione}.map(&:first).map(&:titleize)
end

def self.options_for_fioritura
  plants = Plant.arel_table
  order(plants[:fioritura].lower).group_by{|e| e.fioritura}.map(&:first).map(&:titleize)
end
