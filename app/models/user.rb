class User < ApplicationRecord
  has_secure_password 
  has_many :user_accounts
  has_many :accounts, through: :user_accounts

  validates :name, presence: true, length: {minimum: 3}
  validates :username, presence: true, uniqueness: true
  validates :password, confirmation: { case_sensitive: true }
  validates :password_confirmation, presence: true

  def generate_token
    token = SecureRandom.urlsafe_base64
  end

end