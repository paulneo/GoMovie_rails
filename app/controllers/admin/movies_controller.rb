class Admin::MoviesController < ApplicationController
  def index
    if params[:q]
      @movies = Movie.search(params[:q]).order("created_at DESC")
    else
      @movies = Movie.all
    end
  end
  def show
    @movie = Movie.find(params[:id])
  end
  def new
    @movie = Movie.new
  end
  def create
    @movie =  Movie.new(movie_params)
    if @movie.save
      redirect_to admin_movies_path
    else
      render :new
    end
  end
  def edit
    @movie =Movie.find(params[:id])
  end
  def update
    @movie = Movie.find(params[:id])
    if @movie.update movie_params
      redirect_to admin_movies_path
    else
      render :edit
    end
  end
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Se borro correctamente"
    redirect_to admin_movies_path
  end
  private

  def movie_params
    params.require(:movie).permit(:name,:star,:category_id,:gender_id,:price,:sinopsys,:time,:image)
  end
end
