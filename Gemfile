source 'https://rubygems.org'

gem 'rails', '4.2.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-sass'

# Rendering questions
gem 'redcarpet'

# Rendering PDFs
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

# gem 'capistrano-rails', group: :development


group :development do
  gem 'byebug'
end

group :development, :test do
  gem 'sqlite3'
  gem 'spring'

  # Better irb and debugging
  gem 'pry-rails'
end

group :test do
  # Integration tests
  gem 'capybara'

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

