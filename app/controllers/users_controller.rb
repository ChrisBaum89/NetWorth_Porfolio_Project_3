class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    binding.pry
    redirect_to user_path(@user)

  end

  def show
    @user = User.find_by_id(params[:id])
    @categories = @user.categories.uniq
    @accounts = @user.accounts
    @net_worth = @user.net_worth_calc
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update

  end

  def user_params
    params.require(:user).permit(:username, :email, :net_worth, :password, :password_confirmation)
  end

end
