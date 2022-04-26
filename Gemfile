# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.4'

gem 'simple_form'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'cssbundling-rails'
gem 'jsbundling-rails'
gem 'puma', '~> 5.0'
gem 'sprockets-rails'
gem 'turbo-rails'
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# gem "sassc-rails"
gem 'devise'

# gem "image_processing", "~> 1.2"

group :development, :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
  gem 'pry-rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 5.0'
end
group :development do
  gem 'web-console'

  # gem "rack-mini-profiler"

  # gem "spring"
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rspec', require: false
end

group :production do
  gem 'pg'
end
