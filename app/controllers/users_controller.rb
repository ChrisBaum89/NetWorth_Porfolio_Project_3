class UsersController < ApplicationController

  def new

  end

  def create

  end

  def show
    @user = User.find_by_id(params[:id])
    @categories = @user.categories.uniq
    @accounts = @user.accounts
    @net_worth = @user.net_worth_calc
  end

  def edit

  end

  def update

  end

end
