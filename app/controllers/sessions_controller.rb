class SessionsController < ApplicationController
  def new
  end

  def create
    if session[:id]
      redirect_to user_path(@user)
    elsif params[:username] != nil && params[:password]
      if @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
      else
        redirect_to signin_path
      end
      session[:user_id] = @user.id
      session[:username] = @user.username
      if admin?
        redirect_to admin_home_path
      else
        redirect_to user_path(@user)
      end
    elsif auth['uid']
      if @user = User.find_by(uid: auth[:uid].to_i)
        @user.username = auth[:info][:name]
        @user.email = auth[:info][:email]
      else
        @user = User.new
        @user.username = auth[:info][:name]
        @user.email = auth[:info][:email]
        @user.uid = auth[:uid]
        @user.password = SecureRandom.urlsafe_base64
        @user.password_confirmation = @user.password
        @user.save
      end
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    redirect_to signin_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
