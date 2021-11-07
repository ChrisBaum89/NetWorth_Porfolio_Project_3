class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user, :admin?

  def current_user
    User.find_by_id(session[:user_id]) || User.new
  end

  def logged_in?
    session.include? :user_id
  end

  def admin?
      current_user.admin == true
  end

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
end
