class Account < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :account_type, presence: true
  validates :dollar_value, presence: true

  def asset_or_debt
    if self.account_type == "debt" && self.dollar_value > 0
      self.dollar_value = 0 - self.dollar_value
    end
    self.save
  end
end
