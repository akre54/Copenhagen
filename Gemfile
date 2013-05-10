source 'https://rubygems.org'

# base
gem 'rails', '3.2.13'
gem 'thin'

# auth
gem 'devise'

# db
gem 'pg'

# needs to be pulled out of assets to work on Heroku
gem 'sass-rails', '~> 3.2.3'

gem 'strong_parameters'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'

  gem 'twitter-bootstrap-rails'
  gem 'bootstrap-sass'

  gem 'requirejs-rails'


  gem 'handlebars_assets', '~> 0.12.0'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'pry-rails'
  gem 'debugger-pry', require: 'debugger/pry'
  gem 'debugger'

  gem 'yaml_db'

  gem 'meta_request'

  # testing
  gem 'rspec-rails'

  # stubs and mocks
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'faker'
end
