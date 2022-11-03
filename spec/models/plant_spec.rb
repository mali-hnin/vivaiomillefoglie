# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Plant, type: :model do
  subject do
    Plant.new(
      name: 'Achillea',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      category: 'erbacee perenni',
      esposizione: 'sole',
      fioritura: 'estate',
      altezza: 'media',
      terreno: 'secco',
      vaso: '12cm',
      disponibile: 'true',
      novità: 'true',
      utile_per: 'farfalle',
      price_cents: '500',
      nascondi: 'false'
    )
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'default price currency should be EUR' do
      expect(subject.price_currency).to eq('EUR')
    end

    it 'prezzo should be transformed to full euros, not cents' do
      expect(subject).to monetize(:price_cents).as(:prezzo).with_currency(:eur)
    end
  end

  describe 'Associations' do
    it { should have_many(:line_items).dependent(:destroy) }
  end

  describe 'Scopes' do
    plant1 = Plant.create(
      name: 'a',
      category: 'erbacee perenni',
      esposizione: 'sole',
      fioritura: 'primavera',
      altezza: 'bassa',
      price_cents: '500',
      utile_per: 'farfalle',
      nascondi: false
    )
    plant2 = Plant.create(
      name: 'b',
      category: 'graminacee',
      esposizione: 'ombra',
      fioritura: 'estate',
      altezza: 'media',
      utile_per: 'azotofissatrice',
      price_cents: '500',
      nascondi: false
    )
    plant3 = Plant.create(
      name: 'c',
      category: 'Altro',
      esposizione: "mezz'ombra",
      fioritura: 'autunno',
      altezza: 'alta',
      utile_per: 'fiori da taglio',
      price_cents: '500',
      nascondi: true
    )

    it 'should order plants alphabetically by name' do
      a = described_class.alphabetically
      expect(a.index(plant3) > a.index(plant2) && a.index(plant2) > a.index(plant1)).to be(true)
    end
    it 'should only show plants with nascondi set to false' do
      expect(described_class.is_visible).to include(plant1).and include(plant2)
      expect(described_class.is_visible).to_not include(plant3)
    end
    it 'should filter plants by the requested category' do
      expect(described_class.filter_by_category('erbacee perenni')).to include(plant1)
      expect(described_class.filter_by_category('erbacee perenni')).to_not include(plant2)
      expect(described_class.filter_by_category('erbacee perenni')).to_not include(plant3)
      expect(described_class.altre_categorie).to_not include(plant1)
      expect(described_class.altre_categorie).to_not include(plant2)
      expect(described_class.altre_categorie).to include(plant3)
    end
    it 'should filter plants by the requested esposizione' do
      expect(described_class.filter_by_esposizione('sole')).to include(plant1)
      expect(described_class.filter_by_esposizione('sole')).to_not include(plant2)
      expect(described_class.filter_by_esposizione('ombra')).to include(plant2) & include(plant3)
    end
    it 'should filter plants by the requested fioritura' do
      expect(described_class.filter_by_fioritura('autunno')).to include(plant3)
      expect(described_class.filter_by_fioritura('autunno')).to_not include(plant2)
    end
    it 'should filter plants by the requested altezza' do
      expect(described_class.filter_by_altezza('media')).to include(plant2)
      expect(described_class.filter_by_altezza('media')).to_not include(plant1)
    end
    it 'should filter plants by the requested funzione' do
      expect(described_class.filter_by_funzione('azoto')).to include(plant2)
      expect(described_class.filter_by_funzione('azoto')).to_not include(plant3)
    end
    it 'should filter plants by 2 functions' do
      expect(described_class.filter_by_doppia_funzione('farfalle', 'fiori')).to include(plant1) & include(plant3)
      expect(described_class.filter_by_doppia_funzione('farfalle', 'fiori')).to_not include(plant2)
    end
  end
end
