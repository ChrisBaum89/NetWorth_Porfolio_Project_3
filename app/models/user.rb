class User < ApplicationRecord
  has_secure_password

  has_many :accounts
  has_many :categories, through: :accounts

  def net_worth_calc
    self.net_worth = 0
    self.accounts.each do |account|
      if account.account_type == "asset"
        self.net_worth = self.net_worth + account.dollar_value
      elsif account.account_type == "debt"
        self.net_worth = self.net_worth - account.dollar_value
      else
      end
    end
    self.save
    self.net_worth
  end
end
