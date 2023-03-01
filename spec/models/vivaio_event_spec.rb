# frozen_string_literal: true

require 'rails_helper'
require 'date'

RSpec.describe VivaioEvent, type: :model do
  subject do
    described_class.new(
      title: 'Lorem ipsum',
      content: nil,
      data_evento: DateTime.now.beginning_of_day + 1.week,
      data_fine_evento: DateTime.now.beginning_of_day + 1.week + 8.hours
    )
  end

  it 'should be valid with valid attributes' do
    expect(subject).to be_valid
  end

  it { should have_rich_text(:content) }

  describe 'Scopes' do
    event1 = VivaioEvent.create(title: 'Lorem ipsum', content: nil,
                                data_evento: DateTime.now.beginning_of_day + 2.weeks,
                                data_fine_evento: DateTime.now.beginning_of_day + 2.weeks + 36.hours)
    event2 = VivaioEvent.create(title: 'Lorem ipsum', content: nil,
                                data_evento: DateTime.now.beginning_of_day - 1.week,
                                data_fine_evento: DateTime.now.beginning_of_day - 1.week + 8.hours)
    it 'should order events by date' do
      expect(described_class.by_event_date.to_a).to match_array(described_class.order(:data_evento).to_a)
    end
    it 'should show only future events' do
      expect(described_class.future).to include(event1)
      expect(described_class.future).to_not include(event2)
    end
    it 'should show only past events' do
      expect(described_class.past).to include(event2)
      expect(described_class.past).to_not include(event1)
    end
  end
end
