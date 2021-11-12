class AdminController < ApplicationController
  before_action :logged_in_admin?

  #home route
  def home
    @number_of_users = User.count

    all_users_net_worth

    all_users_average_net_worth

    all_users_debt

    all_users_average_debt

  end

  #calculate net worth for all users
  def all_users_net_worth
    @total_net_worth = 0
    User.all.each do |user|
      @total_net_worth = @total_net_worth + user.net_worth
    end
  end

  #calculate average net worth for all users
  def all_users_average_net_worth
    @average_net_worth = @total_net_worth / @number_of_users
  end

  #calculate debt for all users
  def all_users_debt
    @total_debt = 0
    Account.all.each do |account|
      if account.account_type == "Debt"
        @total_debt = @total_debt + account.dollar_value
      end
    end
  end

  #calculate average debt for all users
  def all_users_average_debt
    @average_debt = @total_debt / @number_of_users
  end

end
