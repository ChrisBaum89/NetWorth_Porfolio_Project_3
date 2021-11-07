class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user, :admin?

  def current_user
    @user = User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def admin?
    current_user.admin == true
  end
end
