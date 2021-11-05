class AccountsController < ApplicationController
  def new
    @account = Account.new
    @user = current_user

  end

  def create
    @account = Account.create(account_params)
    redirect_to account_path(@account)
  end

  def show
    @account = Account.find_by_id(params[:id])
  end

  def index

  end

  def edit
    @account = Account.find_by_id(params[:id])
  end

  def update

  end

  def account_params
    params.require(:account).permit(:name, :account_type, :dollar_value, :user_id, :category_id)
  end
end
