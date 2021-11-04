class AccountsController < ApplicationController
  def new
    @account = Account.new

  end

  def create

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
end
