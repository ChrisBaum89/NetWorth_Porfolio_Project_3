class UsersController < ApplicationController

  def new
    @user = User.new
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
    @user = User.find_by_id(params[:id])
  end

  def update

  end

end
