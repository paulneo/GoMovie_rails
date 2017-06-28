class Admin::CategoriesController < ApplicationController
  before_action :find_category, only: [:show,:destroy, :edit, :update]
  def index
    @categories = Category.all
  end

  def show

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end

  end
  private
  def find_category
    @category = Category.find(params[:id])
  end
  def category_params
    params.fetch(:category).permit(:name)
  end
end
