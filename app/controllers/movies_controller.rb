class MoviesController < ApplicationController
  before_action :redirect_unless_admin, :except => [:show, :all]

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def all
    @movies = Movie.all.page(params[:page]).per(12)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def search
    @movies = Movie.search(params[:search])
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
      redirect_to controller: :movies, action: :all
    else
      render "edit"
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to controller: :movies, action: :all
  end

  private

  def movie_params
    params.require(:movie).permit!
  end

  def redirect_unless_admin
    if user_signed_in?
      redirect_to controller: :movies, action: :all unless current_user.admin? 
    else
      redirect_to controller: :movies, action: :all
    end
  end
end
