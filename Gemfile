# frozen_string_literal: true

source "https://rubygems.org"
ruby "3.0.4"

# To force bundler to load github repos thru https protocol
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Basic gems
gem "actionview", ">= 5.2.2.1"
gem "coffee-rails"
gem "devise", ">= 4.7.1"
gem "figaro"
gem "jbuilder", "~> 2.0"
gem "nokogiri", ">= 1.16.7"
gem "pg"
gem "puma", ">= 4.3.8"
gem "racc", "~> 1.5.2"
gem "rails", "7.0.8.1"
gem "railties", ">= 5.2.2.1"
gem "redis"
gem "webpacker", "~> 6.0.0.rc.5"

# deploy gems
group :development do
  gem "capistrano", "3.16", require: false
  gem "capistrano-passenger", "~> 0.2.1"
  gem "capistrano-rails", "~> 1.6", require: false
  gem "capistrano-rbenv", "~> 2.1", ">= 2.1.4"
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "web-console", ">= 3.3.0"
end

# specific gems
# to export data to xls:
gem "caxlsx"
gem "caxlsx_rails"
gem "faker"
# client library for making http requests from Ruby
gem "aws-sdk-s3", require: false
gem "http", "~> 4.4.1"
gem "jquery-fileupload-rails"
gem "money-rails", "~>1.12"
gem "pagy"
gem "pg_search", "~> 2.3.0"
gem "turbo-rails"
gem "yaml_db"

# Front-end gems
gem "autoprefixer-rails"
gem "bootstrap-sass", ">= 3.4.1"
gem "font-awesome-sass"
gem "image_processing", "~> 1.12"
gem "jquery-rails"
gem "jquery-slick-rails"
gem "sass-rails"
gem "simple_form", ">= 5.0.0"
gem "uglifier"

# Test and development gems
group :development, :test do
  gem "better_errors"
  gem "capybara-selenium"
  gem "listen", "~> 3.0.5"
  gem "next_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rails-controller-testing"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "spring", ">= 3.0.0"
  # gem 'spring-watcher-listen', '~> 2.0.0'
  gem "webdrivers"
end
