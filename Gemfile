source 'https://rubygems.org'

gem 'rails', '4.2.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-sass'

# Database
gem 'mysql2'

# Rendering questions
gem 'redcarpet'

# Rendering PDFs
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

# Ember
gem 'ember-cli-rails'

# Custome serialization for API
gem 'active_model_serializers', github: "rails-api/active_model_serializers"

# Ordering for questions
gem 'acts_as_list'

group :development do
  gem 'capistrano-rails'
end

group :development, :test do
  gem 'sqlite3'
  gem 'spring'
  gem 'byebug'

  # Better irb and debugging
  gem 'pry-rails'
  gem 'pry-byebug'

  gem 'database_cleaner'
end

group :test do
  # Integration tests
  gem 'capybara'

  # Enable javascript for SPA
  gem 'selenium-webdriver'

  # View headless integration test pages for debugging
  gem 'launchy'

  # Prettier test output
  gem 'minitest-reporters'

  # Silence backtracing into libraries
  gem 'mini_backtrace'

  # Automatic tests
  gem 'guard'
  gem 'guard-minitest'

  # Required for travis
  gem 'rake'
end

group :development do
  gem 'web-console', '~> 2.0'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
  gem 'puma'
end
