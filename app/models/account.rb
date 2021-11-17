class Account < ApplicationRecord 
  has_many :user_accounts
  has_many :users, through: :user_accounts
  validates :name, presence: true, length: {minimum: 3}, uniqueness: true
end