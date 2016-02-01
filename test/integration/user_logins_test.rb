require 'test_helper'

class UserLoginsTest < ActionDispatch::IntegrationTest
  test "user can login successfully" do
    get login_path

    post_via_redirect login_path, session: { username: "tom",
                                             password: "123456"
    }

    assert_template 'users/show'
  end

  test "user can not login with wrong password" do
    get login_path

    post login_path, session: { username: "tom",
                                password: "12345"
    }

    assert_template 'sessions/new'
  end

  test "user can not login with missing username" do
    get login_path

    post login_path, session: { username: "tom2",
                                password: "12345"
    }

    assert_template 'sessions/new'
  end
end
