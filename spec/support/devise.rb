# frozen_string_literal: true

require_relative './request_macros'
# require_relative './download_helpers'

RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.extend RequestMacros, type: :request
  # config.include DownloadHelpers, type: :request
end
