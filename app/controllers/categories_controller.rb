class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create

  end

  def show

  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find_by_id(params[:id])
  end

  def update

  end

end
