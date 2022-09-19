require_relative './request_macros'

RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.extend RequestMacros, type: :request
end
