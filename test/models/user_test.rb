require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valid user should save" do
    user = User.new

    user.password = "123456"
    user.password_confirmation = "123456"
    user.name = "bob"
    user.username = "bob"

    assert user.save
  end

  test "empty user should not save" do
    user = User.new
    assert_not user.save
  end

  test "user should not save without a password" do
    user = User.new
    user.username = "bob"
    user.name = "bob"
    assert_not user.save
  end

  test "user should not save without a username" do
    user = User.new
    user.name = "bob"
    user.password = "1234"
    user.password_confirmation = "1234"

    assert_not user.save
  end

  test "user should not save without a name" do
    user = User.new

    user.username = "bob"
    user.password = "1234"
    user.password_confirmation = "1234"

    assert_not user.save
  end

  test "user should not save without both passwords" do
    user = User.new
    user.password = "1234"
    user.username = "bob"
    user.name = "bob"

    assert_not user.save
  end

  test "user should have six or more chars in password" do
    user = User.new

    user.password = "1234"
    user.password_confirmation = "1234"
    user.name = "bob"
    user.username = "bob"

    assert_not user.save
  end
end
