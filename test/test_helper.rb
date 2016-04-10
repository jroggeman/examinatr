ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

#Integration tests
require 'capybara/rails'

# Prettier test output
require 'minitest/reporters'
MiniTest::Reporters.use!

require 'database_cleaner'

DatabaseCleaner.strategy = :transaction

class ActiveSupport::TestCase
  fixtures :all
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  setup do
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
    Capybara.reset_sessions!
  end

  def login_as(user, password)
    visit('/login')

    fill_in('Username', with: user.username)
    fill_in('Password', with: password)
    click_on('Log In')
  end

  def api_login_as(user, password)
    post '/login', session: { username: user.username, password: password }
  end

  def json
    JSON.parse(response.body)
  end
end
