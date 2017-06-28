class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
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
      render new_admin_movie_path
    end
  end
  def update
    @movie = Movie.find(params[:id])
    if @movie.update movie_params
      redirect_to admin_movies_path
    else
      render edit_admin_movie_path
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
    params.require(:movie).permit(:name,:star,:category,:gender,:price,:sinopsys,:time,:image)
  end
end
