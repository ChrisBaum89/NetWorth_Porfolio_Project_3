class AccountsController < ApplicationController
  def new
    @account = Account.new

  end

  def create
    @account = Account.create(account_params)
  end

  def show

  end

  def index

  end

  def edit
    @account = Account.find_by_id(params[:id])
  end

  def update

  end

  def account_params
    params.require(:account).permit(:name, :account_type, :dollar_value)
  end
end
