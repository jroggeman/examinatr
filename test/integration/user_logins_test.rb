require 'test_helper'

class UserLoginsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = :selenium
  end

  teardown do
    Capybara.use_default_driver
  end

  test "user can login successfully" do
    visit('/login')

    fill_in('Username', with: 'tom')
    fill_in('Password', with: '123456')
    click_on('Log In')

    assert page.has_content?("Exams")
  end

  test "user can not login with wrong password" do
    visit('/login')

    fill_in('Username', with: 'tom')
    fill_in('Password', with: '12345')
    click_on('Log In')

    assert page.has_content?("Log In")
  end

  test "user can not login with missing username" do
    visit('/login')

    fill_in('Username', with: 'tom2')
    fill_in('Password', with: '12345')
    click_on('Log In')

    assert page.has_content?("Log In")
  end

  test "user is redirected from login page if already logged in" do
    visit('/login')

    fill_in('Username', with: 'tom')
    fill_in('Password', with: '123456')
    click_on('Log In')

    assert page.has_content?("Exams")

    visit('/login')
    assert page.has_content?("Exams")
  end

  test "user is redirected to login page on logout" do
    visit('/login')

    fill_in('Username', with: 'tom')
    fill_in('Password', with: '123456')
    click_on('Log In')

    assert page.has_content?("Exams")

    visit('/logout')

    assert has_current_path?('/')
  end
end
