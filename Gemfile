source 'https://rubygems.org'
ruby '2.3.4'

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
gem 'rails', '5.1.4'
gem 'redis'
# gem 'webpacker', '~> 3.0'
gem 'coffee-rails'

# specific gems
gem 'cloudinary', '1.1.7'
gem 'attachinary', github: 'assembler/attachinary'
gem 'jquery-fileupload-rails'
gem 'faker'

# Front-end gems
gem 'autoprefixer-rails'
gem 'bootstrap-sass'
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
