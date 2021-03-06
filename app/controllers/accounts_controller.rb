class AccountsController < ApplicationController
  #new route
  def new
    @user = current_user
    @account = Account.new
    @error_variable = @account
  end

  #create route
  def create
    @user = current_user
    @account = Account.new(account_params)
    if @account.valid?
      debt_value_check(@account)
      update_net_worth(@user)
      @account.save
      redirect_to account_path(@account)
    else
      @error_variable = @account
      render :new
    end
  end

  #show route
  def show
    @user = current_user
    @account = Account.find_by_id(params[:id])
    @category = Category.find_by_id(@account.category_id)
    @updated_time = @account.updated_at.localtime.strftime('%a, %d %b %Y %H:%M:%S')
  end

  #index route
  def index
    @user = User.find_by_id(params[:user_id])
    @accounts = @user.accounts
  end

  #edit route
  def edit
    @account = Account.find_by_id(params[:id])
    @user = @account.user
    @account = Account.find_by_id(params[:id])
    @error_variable = @account
  end

  #update route
  def update
    account = Account.find_by_id(params[:id])
    account.update(account_params)
    debt_value_check(account)
    account.save
    redirect_to account_path(account)
  end

  #destroy route
  def destroy
    account = Account.find_by_id(params[:id])
    user = account.user
    account.destroy
    redirect_to user_path(user)
  end

  #used for mass assignment for new object from new/edit form information
  def account_params
    params.require(:account).permit(:name, :account_type, :dollar_value, :user_id, :category_id)
  end

  #if the account type has debt selected but a positive value is put in, this method
  #will change the value to a negative number
  def debt_value_check(account)
    if account.account_type == "Debt" and account.dollar_value > 0
      account.dollar_value = 0 - account.dollar_value
    end
  end

end
