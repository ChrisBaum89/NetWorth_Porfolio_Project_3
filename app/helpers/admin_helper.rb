module AdminHelper

#calculate net worth for all users
def all_users_net_worth
  User.sum("net_worth")
end

#calculate average net worth for all users
def all_users_average_net_worth
  User.average("net_worth")
end

#calculate debt for all users
def all_users_debt
  @total_debt = 0
  Account.all.each do |account|
    if account.account_type == "Debt"
      @total_debt = @total_debt + account.dollar_value
    end
  end
  @total_debt
end

#calculate average debt for all users
def all_users_average_debt
  @average_debt = @total_debt / @number_of_users
end

end
