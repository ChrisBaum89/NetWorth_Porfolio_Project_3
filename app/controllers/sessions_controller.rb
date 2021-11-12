class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new

    #if session already created, always redirect back to user show
    if session[:id]
      redirect_to user_path(@user)

    elsif params[:username] != nil && params[:password] != nil && auth == nil
      @user = User.find_by(username: params[:username])

      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        session[:username] = @user.username
        if admin?
          redirect_to admin_home_path
        else
          redirect_to user_path(@user)
        end
      else
        redirect_to signin_path
      end

    #login using Omniauth (facebook)
    elsif auth
      if @user = User.find_by(uid: auth[:uid].to_i)
        @user.username = auth[:info][:name]
        @user.email = auth[:info][:email]
        redirect_to user_path(@user)
      else
        omniauth_new_user
        if @user.save
          redirect_to user_path(@user)
        else
          render :new
        end
      end
      session[:user_id] = @user.id
    else
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

  def omniauth_new_user
    @user = User.new
    @user.username = auth[:info][:name]
    @user.email = auth[:info][:email]
    @user.uid = auth[:uid]

    #assign random password for omniauth
    @user.password = SecureRandom.urlsafe_base64
    @user.password_confirmation = @user.password
  end

end
