class Plant < ApplicationRecord
  validates :name, presence: true
  has_one_attached :photo
  monetize :price_cents, as: "prezzo"
  scope :alphabetically, -> { order("name ASC") }
  scope :recently_created, -> { order("created_at DESC") }
  scope :recently_updated, -> { order("updated_at DESC") }
  scope :is_visible, -> { where(nascondi: false) }
  scope :filter_by_category, ->(category) { where("category ILIKE ?", "%" + category + "%") }
  scope :altre_categorie, lambda {
                            where.not("category ILIKE ?", "erbacee perenni").where.not("category ILIKE ?", "erbacee annuali").where.not("category ILIKE ?", "graminacee")
                          }
  scope :filter_by_esposizione, ->(esposizione) { where("esposizione ILIKE ?", "%" + esposizione + "%") }
  scope :filter_by_fioritura, ->(fioritura) { where("fioritura ILIKE ?", "%" + fioritura + "%") }
  scope :filter_by_altezza, ->(altezza) { where("altezza ILIKE ?", "%" + altezza + "%") }
  scope :filter_by_funzione, ->(funzione) { where("utile_per ILIKE ?", "%" + funzione + "%") }
  scope :filter_by_doppia_funzione, lambda { |funzione, funzione_bis|
                                      where("utile_per ILIKE ?", "%" + funzione + "%").or(where("utile_per ILIKE ?", "%" + funzione_bis + "%"))
                                    }

  has_many :line_items, dependent: :destroy
  include PgSearch::Model
  pg_search_scope :search_plants, against: %i[name description category utile_per],
                                  using: { tsearch: { any_word: true } }

  include Filterable

  private

    def self.options_for_category
      [
        ["Erbacee perenni"],
        ["Erbacee annuali"],
        ["Graminacee"],
        ["Alberi"],
        ["Arbusti"],
        ["Rampicanti"]
      ]
    end

    def self.options_for_fioritura
      %w[Primavera Estate Autunno Inverno]
    end

    def self.options_for_altezza
      %w[Alta Media Bassa]
    end

    def self.options_for_esposizione
      [
        ["Sole"],
        ["Ombra"],
        ["Mezz'ombra", "mezz"]
      ]
    end

    def self.options_for_funzione
      [
        ["Azotofissatrici", "azoto"],
        ["Spontanee", "spontane"],
        ["Coprisuolo"],
        ["Fogliame decorativo", "fogliame"],
        ["Fiori da taglio", "taglio"],
        ["Insetti"],
        ["Farfalle"],
        ["Terreni aridi", "arid"],
        ["Da secco", "secco"]
      ]
    end

    # all_options_for methods return ALL variants of currently existing data for the chosen attribute
    def self.all_options_for_category
      plants = Plant.arel_table
      order(plants[:category].lower).group_by { |e| e.category.downcase.strip }.map(&:first).map(&:titleize)
    end

    def self.all_options_for_esposizione
      plants = Plant.arel_table
      order(plants[:esposizione].lower).group_by { |e| e.esposizione.downcase.strip }.map(&:first).map(&:titleize)
    end

    def self.all_options_for_funzione
      plants = Plant.arel_table
      functions = Plant.order(plants[:utile_per].lower).group_by { |e| e.utile_per.downcase.strip }.map(&:first)
      # bc utile_per can often be empty, this if clause returns an empty string if none of the plants
      # in the page have an utile_per, otherwise it raises an error for titleize on nil class
      return functions[0] if functions[1].nil?

      functions.map(&:titleize)
    end

    def self.to_csv
      CSV.generate do |csv|
        csv << column_names
        all.find_each do |result|
          csv << result.attributes.values_at(*column_names)
        end
      end
    end

    # Check if needed
    def not_referenced_by_any_line_item
      return if line_items.empty?

      errors.add(:base, "Line items present")
      throw :abort
    end
end
