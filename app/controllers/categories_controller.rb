class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    redirect_to category_path(category.id)
  end

  def show
    @category = Category.find_by_id(params[:id])
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
