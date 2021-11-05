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

    #prevent users from being able to see other users
    if @user.id == current_user.id
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

  def user_params
    params.require(:user).permit(:username, :email, :net_worth, :password, :password_confirmation)
  end

end
