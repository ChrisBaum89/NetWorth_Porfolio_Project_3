class User < ApplicationRecord
  has_secure_password

  has_many :accounts
  has_many :categories, through: :accounts

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  def net_worth_calc
    self.net_worth = 0
    self.accounts.each do |account|
      account.asset_or_debt
      self.net_worth = self.net_worth + account.dollar_value
    end
    self.save
    self.net_worth
  end
end
