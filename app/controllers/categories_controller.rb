class CategoriesController < ApplicationController
  include CategoriesHelper
  before_action :logged_in_admin?

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.valid?
      @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    @category = Category.find_by_id(params[:id])

    #calculate net worth of the category
    @category_value = category_total_value(@category)
    @category_users = @category.users.uniq.count
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find_by_id(params[:id])
  end

  def update
    category = Category.find_by_id(params[:id])
    category.update(category_params)
    redirect_to category_path(category)
  end

  def destroy
    if admin?
      category = Category.find_by_id(params[:id])

      #need to re-assign all accounts within this category to unassigned category_id
      uncategorized = Category.find_by(:name ["Uncategorized"])
      category.accounts.each do |account|
        account.category_id = uncategorized
        account.save
      end

      category.destroy
      redirect_to categories_path
    end
  end

  def category_params
    params.require(:category).permit(:name, :dollar_value, :number_of_users)
  end

  def category_total_value(category)
    category_value = 0
    category.accounts.each do |account|
      category_value = category_value + account.dollar_value
    end
    category_value
  end

end
