class UsersController < ApplicationController
  before_action :logged_in_admin?, only: [:index]

  def new
    @user = User.new
  end

  def create
    if params[:user][:password]
      @user = User.new(user_params)
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
    else
      redirect_to new_user_path
    end
  end

  #for admins only
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    @admin = admin?
    #prevent users from being able to see other users
    if (current_user.id == @user.id) || admin?
      @categories = @user.categories.uniq
      @accounts = @user.accounts
      @net_worth = @user.net_worth_calc
    else
      redirect_to user_path(current_user)
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update

  end

  def destroy
    if admin?
      user = User.find_by_id(params[:id])
      user.accounts.destroy_all
      user.destroy
      redirect_to users_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :net_worth, :password, :password_confirmation, :admin)
  end

end
