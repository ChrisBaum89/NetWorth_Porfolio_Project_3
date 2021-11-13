class CategoriesController < ApplicationController
  include CategoriesHelper
  before_action :logged_in_admin?


  #index route
  def new
    @category = Category.new
    @error_variable = @category
  end

  #create route
  def create
    @category = Category.new(category_params)


    #verify category is valid before saving
    if @category.valid?
      @category.save
      redirect_to category_path(@category)
    else
      @error_variable = @category
      render :new
    end
  end

  #show route
  def show
    @category = Category.find_by_id(params[:id])
  end

  #index route
  def index
    @categories = Category.all
  end

  #edit route
  def edit
    @category = Category.find_by_id(params[:id])
    @error_variable = @account
  end

  #update route
  def update
    category = Category.find_by_id(params[:id])
    category.update(category_params)
    redirect_to category_path(category)
  end

  #destory route
  def destroy
    if admin?
      category = Category.find_by_id(params[:id])

      #need to re-assign all accounts within this category to unassigned category_id
      assign_to_uncategorized
      category.destroy
      redirect_to categories_path
    end
  end

  #used for mass assignment for new object from new/edit form information
  def category_params
    params.require(:category).permit(:name, :dollar_value, :number_of_users)
  end



  #When admin deletes a category, all accounts associated with that category are
  #assigned to "Uncategorized" category. This is to prevent users accounts from
  #being deleted or lost if an admin has to remove a category
  def assign_to_uncategorized
    uncategorized = Category.find_by(:name ["Uncategorized"])
    category.accounts.each do |account|
      account.category_id = uncategorized
      account.save
    end
  end

end
