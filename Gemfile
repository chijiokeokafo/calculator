source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# bootstrap sass framework
# gem 'bootstrap-sass', '~> 3.3.4'
gem 'bootstrap-sass', '~> 3.3.4.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#authentication and authorization 
gem "sorcery"
gem 'cancancan', '~> 1.10'

#mailer gem
gem "actionmailer"
#Scss frame work

# Image gem
gem 'carrierwave'
gem "mini_magick"

gem 'geocoder'

gem "cocoon"
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
  gem 'letter_opener', :group => :development

group :development do
	gem 'sqlite3' 
end

group :development, :test do
  gem 'quiet_assets'
  gem 'spring'
  gem 'best_errors'
  gem 'pry-rails'

  gem 'rspec-rails', '~> 3.0'
end

group :production do
	gem 'pg'
end



