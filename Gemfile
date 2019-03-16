source 'https://rubygems.org'
ruby '2.5.3'

# To force bundler to load github repos thru https protocol
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Basic gems
gem 'devise'
gem 'figaro'
gem 'jbuilder', '~> 2.0'
gem 'pg'
gem 'puma'
gem 'rails', '>=5.2.2'
gem 'redis'
# gem 'webpacker', '~> 3.0'
gem 'coffee-rails'
gem "actionview", ">= 5.2.2.1"
gem "railties", ">= 5.2.2.1"

# specific gems
gem 'cloudinary', '1.1.7'
gem 'attachinary', github: 'assembler/attachinary'
gem 'jquery-fileupload-rails'
gem 'faker'
gem 'money-rails', '~>1.12'
gem 'yaml_db'



# Front-end gems
gem 'autoprefixer-rails'
gem "bootstrap-sass", ">= 3.4.1"
gem 'font-awesome-sass'
gem 'jquery-rails'
gem 'sass-rails'
gem 'simple_form'
gem 'uglifier'
gem 'jquery-slick-rails'

# Test and development gems
group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
end
