class AccountsController < ApplicationController
  def new
    @user = current_user
    @account = Account.new
  end

  def create
    @user = current_user
    account = Account.new(account_params)
    if account.valid?
      debt_value_check(account)
      account.save
      redirect_to account_path(account)
    else
      @account = account
      render :new
    end
  end

  def show
    @user = current_user
    @account = Account.find_by_id(params[:id])
    @category = Category.find_by_id(@account.category_id)
  end

  def index
    @user = User.find_by_id(params[:user_id])
    @accounts = @user.accounts
  end

  def edit
    @user = @account.user
    @account = Account.find_by_id(params[:id])
  end

  def update
    account = Account.find_by_id(params[:id])
    account.update(account_params)
    redirect_to account_path(account)
  end

  def destroy
    account = Account.find_by_id(params[:id])
    user = account.user
    account.destroy
    redirect_to user_path(user)
  end

  def account_params
    params.require(:account).permit(:name, :account_type, :dollar_value, :user_id, :category_id)
  end

  def debt_value_check(account)
    if account.account_type == "Debt" and account.dollar_value > 0
      account.dollar_value = 0 - account.dollar_value
    end
  end
end
