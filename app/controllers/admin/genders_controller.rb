class Admin::GendersController < ApplicationController
  before_action :find_category, only: [:show,:destroy, :edit, :update]
  def index
    @genders = Gender.all
  end

  def show

  end

  def new
    @gender = Gender.new
  end

  def create
    @gender = Gender.new gender_params
    if @gender.save
      redirect_to admin_genders_path
    else
      render :new
    end

  end
  private
  def find_category
    @gender = Gender.find(params[:id])
  end
  def gender_params
    params.fetch(:gender).permit(:name)
  end
end
