class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user, :admin?

  #gives current user assigned with the session or assigns a dummy User to avoid errors
  def current_user
    User.find_by_id(session[:user_id]) || User.new
  end

  #true or false if a session is active which indicates a user is logged in
  def logged_in?
    session.include? :user_id
  end

  #true or false if current user is an admin user
  def admin?
      current_user.admin == true
  end

  #verifies if a session is active and the logged in user is an admin, else
  #returns forbidden page to prevent access
  def logged_in_admin?
    if logged_in?
      if admin?
        true
      else
        return head(:forbidden)
      end
    else
      return head(:forbidden)
    end
  end

  def update_net_worth(user)
    user.net_worth = user.accounts.sum('dollar_value')
    user.save
  end
end
