class AdminController < ApplicationController
  before_action :logged_in_admin?

  #home route
  def home
    @number_of_users = User.count
  end

end
