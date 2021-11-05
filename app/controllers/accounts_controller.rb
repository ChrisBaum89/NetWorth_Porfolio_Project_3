class AccountsController < ApplicationController
  def new
    @account = Account.new
    @user = current_user
  end

  def create
    account = Account.create(account_params)
    if account.account_type == "Debt" and account.dollar_value > 0
      account.dollar_value = 0 - account.dollar_value
      account.save
    end
    redirect_to account_path(account)
  end

  def show
    @account = Account.find_by_id(params[:id])
    @category = Category.find_by_id(@account.category_id)
  end

  def index

  end

  def edit
    @account = Account.find_by_id(params[:id])
  end

  def update
    account = Account.find_by_id(params[:id])
    account.update(account_params)
    redirect_to account_path(account)
  end

  def account_params
    params.require(:account).permit(:name, :account_type, :dollar_value, :user_id, :category_id)
  end
end
