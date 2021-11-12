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
      binding.pry
      if @user = User.find_by(username: auth[:info][:name])
        session[:user_id] = @user.id
      else
        binding.pry
        @user = User.new(auth[:info][:name], auth[:info][:email], 0)
      end
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
