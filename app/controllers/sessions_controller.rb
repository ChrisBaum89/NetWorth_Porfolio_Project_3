class SessionsController < ApplicationController
  def new

  end

  def create
    if session[:username]
      redirect_to "/"
    elsif params[:username] != nil && params[:username] != ""
        session[:username] = params[:username]
        redirect_to "/"
    else
      redirect_to "/login"
    end
  end

  def destroy
    session.delete :name
  end
end
