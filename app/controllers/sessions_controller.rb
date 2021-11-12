class SessionsController < ApplicationController
  helper_method :update_net_worth

  #new route
  def new
    @user = User.new
  end

  #create route
  def create
    @user = User.new

    #if session already created, always redirect back to user show
    if session[:id]
      redirect_to user_path(@user)

    #if received standard login credentials (non-omniauth)
    elsif auth == nil
      @user = User.find_by(username: params[:username])

      #verify user is found and password is authenticated
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        session[:username] = @user.username
        update_net_worth(@user)

        #verify if user is an admin and redirect accordingly
        if admin?
          redirect_to admin_home_path
        else
          redirect_to user_path(@user)
        end
      else
        #if not correct login, redirect back to signin_path
        redirect_to signin_path
      end

    #login using Omniauth (facebook)
    elsif auth
      #if omniauth User found
      if @user = User.find_by(uid: auth[:uid].to_i)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      #if omniauth User not found, create User
      else
        omniauth_new_user
        #if omniauth user saves successfully
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          redirect_to signin_path
        end
      end
    else
    end
  end

  #destroy route
  def destroy
    session.clear
    redirect_to signin_path
  end

  private

  #gets omniauth user information
  def auth
    request.env['omniauth.auth']
  end

  #new omniauth user and assigns new User parameters
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
