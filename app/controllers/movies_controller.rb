class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def all
    @movies = Movie.all
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      redirect_to controller: :movies, action: :all
    else
      render "new"
    end
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    if @movie.save
      redirect_to controller :movies, action: :all
    else
      render "new"
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
  end

  private

  def movie_params
    params.require(:movie).permit!
  end
end
