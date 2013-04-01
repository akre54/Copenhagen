source 'https://rubygems.org'

# base
gem 'rails', '3.2.12'
gem 'thin'

# views
gem 'bootstrap-sass'

# auth
gem 'devise'

# db
gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'twitter-bootstrap-rails'

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

  # testing
  gem 'rspec-rails'

  # stubs and mocks
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'faker'
end
