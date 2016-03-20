require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    visit('/register')

    assert_no_difference 'User.count' do
      fill_in('Name', with: '')
      fill_in('Username', with: '')
      fill_in('Password', with: '123')
      fill_in('Password confirmation', with: '456')

      click_on('Register')
    end

    assert page.has_content?("New User")
  end

  test "Signup with valid information" do
    visit('/register')

    # Register a new user
    assert_difference 'User.count', 1 do
      fill_in('Name', with: 'Bob')
      fill_in('Username', with: 'bob_smith')
      fill_in('Password', with: '123456')
      fill_in('Password confirmation', with: '123456')
      click_on('Register')
    end

    assert_equal exams_path, current_path
  end
end
