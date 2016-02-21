class User < ActiveRecord::Base
  has_secure_password
  has_many :exams
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true

  # Should have password and confirmation when creating user
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  before_create do |u|
    u.api_key = User.generate_api_key
  end

  private

  def self.generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(api_key: token)
    end
  end
end
