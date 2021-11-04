class Account < ApplicationRecord
  belongs_to :user
  belongs_to :category

  def asset_or_debt
    if self.account_type == "debt"
      self.dollar_value = 0 - self.dollar_value
    end
    self.save
  end
end
