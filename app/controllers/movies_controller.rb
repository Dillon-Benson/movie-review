class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def show
  end

  def all
    @movies = Movie.all
  end

  def edit
  end

  def create
    @movie = Movie.create(movie_params(params))
    if @movie.save
      redirect_to controller: :movies, action: :all
    else
      render "new"
    end
  end

  def update
  end

  def destroy
  end

  private

  def movie_params(params)
    params.require(:movie).permit!
  end
end
