class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    category = Category.create(category_params)
    redirect_to category_path(category)
  end

  def show
    @category = Category.find_by_id(params[:id])

    #calculate net worth of the category
    @category_value = 0
    @category.accounts.each do |account|
      @category_value = @category_value + account.dollar_value
    end
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

  def category_params
    params.require(:category).permit(:name, :dollar_value, :number_of_users)
  end

end
