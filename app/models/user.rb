class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true

  # Should have password and confirmation when creating user
  validates :password, presence: true, length: { minimum: 6 }, on: :create
end
