ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

#Integration tests
require 'capybara/rails'

# Prettier test output
require 'minitest/reporters'
MiniTest::Reporters.use!

class ActiveSupport::TestCase
  fixtures :all
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  teardown do
    Capybara.reset_sessions!
  end

  def login_as(user, password)
    visit('/login')

    fill_in('Username', with: user.username)
    fill_in('Password', with: password)
    click_on('Log In')
  end
end
