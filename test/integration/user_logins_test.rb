require 'test_helper'

class UserLoginsTest < ActionDispatch::IntegrationTest
  test "user can login successfully" do
    get login_path

    post_via_redirect login_path, session: { username: "tom",
                                             password: "123456"
    }

    assert_template 'exams/index'
    assert_not_nil session[:user_id]
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

  test "user is redirected from login page if already logged in" do
    get login_path

    post_via_redirect login_path, session: { username: "tom",
                                             password: "123456"
    }

    assert_template 'exams/index'
    assert_not_nil session[:user_id]

    get_via_redirect login_path
    assert_template 'exams/index'
  end
end
