module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter_params(filtering_params)
      results = self.where(nil)
      filtering_params.each do |key, value|
        results = results.send("filter_by_#{key}", value) if value.present?
      end
      results
    end
  end
end
