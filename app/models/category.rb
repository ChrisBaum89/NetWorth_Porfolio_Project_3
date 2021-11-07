class Category < ApplicationRecord
  has_many :accounts
  has_many :users, through: :accounts

  validates :name, presence: true
  validates :name, uniqueness: true

  def user_category_value_calc(user)
    user_category_value = 0
    self.accounts.each do |account|
      if account.user_id == user.id
        user_category_value = user_category_value + account.dollar_value
      end
    end
    user_category_value
  end
end
