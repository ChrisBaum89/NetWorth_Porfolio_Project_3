class AdminController < ApplicationController
  before_action :logged_in_admin?
  
  def home
    @number_of_users = User.count

    @total_net_worth = 0
    User.all.each do |user|
      @total_net_worth = @total_net_worth + user.net_worth
    end

    @average_net_worth = @total_net_worth / @number_of_users

    @total_debt = 0
    Account.all.each do |account|
      if account.account_type == "Debt"
        @total_debt = @total_debt + account.dollar_value
      end
    end

    @average_debt = @total_debt / @number_of_users
  end

end
