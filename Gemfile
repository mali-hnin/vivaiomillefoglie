source 'https://rubygems.org'
ruby '2.5.3'

# To force bundler to load github repos thru https protocol
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Basic gems
gem "devise", ">= 4.7.1"
gem 'figaro'
gem 'jbuilder', '~> 2.0'
gem 'pg'
gem "puma", ">= 4.3.8"
gem 'rails', "6.1.3.2"
gem 'redis'
# gem 'webpacker', '~> 3.0'
gem 'coffee-rails'
gem "actionview", ">= 5.2.2.1"
gem "railties", ">= 5.2.2.1"



gem "nokogiri", ">= 1.11.0.rc4"



# deploy gems
group :development do
  gem 'capistrano', '~> 3.10', require: false
  gem 'capistrano-rails', '~> 1.6', require: false
  gem 'capistrano-passenger', '~> 0.2.1'
  gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4'
end
# specific gems
gem 'cloudinary', '1.1.7'
gem 'attachinary', github: 'assembler/attachinary'
gem 'jquery-fileupload-rails'
gem 'faker'
gem 'money-rails', '~>1.12'
gem 'yaml_db'
gem 'pagy'
gem 'pg_search', '~> 2.3.0'
# to export data to xls:
gem 'caxlsx'
gem 'caxlsx_rails'
# client library for making http requests from Ruby
gem 'http', '~> 4.4.1'


# Front-end gems
gem 'autoprefixer-rails'
gem "bootstrap-sass", ">= 3.4.1"
gem 'font-awesome-sass'
gem 'jquery-rails'
gem 'sass-rails'
gem "simple_form", ">= 5.0.0"
gem 'uglifier'
gem 'jquery-slick-rails'

# Test and development gems
group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
end
