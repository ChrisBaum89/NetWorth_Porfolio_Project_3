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
      binding.pry
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.delete :name
  end
end
