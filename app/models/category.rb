class Category < ApplicationRecord
  has_many :accounts
  has_many :users, through: :accounts
end
