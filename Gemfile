source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'aws-sdk-s3', require: false
gem 'bootstrap', git: 'https://github.com/twbs/bootstrap-rubygem'
# gem "bootstrap-sass"
gem 'bcrypt', '~> 3.1.7'
gem 'cocoon'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'dotenv-rails', :groups => [:development, :test]

gem 'gon'
gem 'skim'
gem 'rabl'

gem 'jbuilder', '~> 2.7'
gem 'pg', '>= 0.18', '< 2.0'
gem 'rails', '~> 5.2.4'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
gem 'jquery-rails'
gem 'material_icons'
gem 'octicons_helper'
gem 'octokit', '~> 4.0'
gem 'rubocop'
gem 'slim-rails'
gem 'sprockets-rails'
gem 'validate_url'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# gem 'webpacker', '~> 4.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 4.0.0.beta3'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'launchy'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
