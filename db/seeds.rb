# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DATA = {
  :user_keys =>
    ["username", "email", "password_digest", "net_worth"],
  :users => [
    ["Max Charles", "mc@email.com", "password", 0],
    ["Skai Jackson", "sj@email.com" "password", 0],
    ["Kaleo Elam", "ke@email.com", "password", 0],
    ["Hayden Byerly", "hb@email.com", "password", 0]
  ],
  :category_keys =>
   ["name", "dollar_value", "number_of_users"],
  :categories => [
    ["Real Estate", 0, 0],
    ["Crypto", 0, 0],
    ["Credit Cards", 0, 0],
    ["Retirement", 0, 0]
  ],
  :account_keys =>
    ["name", "account_type", "dollar_value", "user_id", "category_id"],
  :accounts => [
    ["MC Primary Residence", "asset", 250000, 1, 1],
    ["MC Rental Property 1", "asset", 150000, 1, 1],
    ["MC Rental Property 2", "asset", 180000, 1, 1],
    ["SJ Primary Residence", "asset", 500000, 2, 1],
    ["SJ Vacation Home", "asset", 305000, 2, 1],
    ["MC Ether", "asset", 10000, 1, 2],
    ["MC Bitcoin", "asset", 15000, 1, 2],
    ["SJ Algo", "asset", 5000, 2, 2],
    ["MC Mastercard", "debt", 2000, 1, 3],
    ["MC Visa", "debt", 2000, 1, 3],
    ["SJ Mastercard", "debt", 3000, 2, 3],
    ["KE Visa", "debt", 1000, 3, 3]
  ]
}


def main
  make_users
  make_categories
  make_accounts
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_categories
  DATA[:categories].each do |category|
    new_category = Category.new
    category.each_with_index do |attribute, i|
      new_category.send(DATA[:category_keys][i]+"=", attribute)
    end
    new_category.save
  end
end

def make_accounts
  DATA[:accounts].each do |account|
    new_account = Account.new
    account.each_with_index do |attribute, i|
      new_account.send(DATA[:account_keys][i]+"=", attribute)
    end
    new_account.save
  end
end

main
