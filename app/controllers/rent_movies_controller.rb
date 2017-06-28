class RentMoviesController < ApplicationController
  def index
    @rent_movies = current_user.rent_movies
    @total_rent = 0
    @rent_movies.each do |rent|
      @total_rent += rent.movie.price
    end
  end

  def create
    id_movie = params[:id_movie]
    @rent_movie = RentMovie.new(user_id: current_user.id, movie_id: id_movie)
    if @rent_movie.save
      redirect_to rent_movies_path
    end
  end
end
