require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
                               username: "",
                               password: "123",
                               password_confirmation: "456"
      }
    end

    assert_template 'users/new'
  end

  test "good signup information" do
    get new_user_path

    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name: "Bob",
                                            username: "bob_smith",
                                            password: "123456",
                                            password_confirmation: "123456"
      }

      assert_template 'users/show'
    end
  end
end
