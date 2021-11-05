class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create

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

end
