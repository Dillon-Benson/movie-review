class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def all
    @reviews = Review.where(user_id: current_user.id)
  end

  def edit
    @review = Review.find(params[:id])
    redirect_to controller: 'movies', action: 'all' unless @review.user_id == current_user.id
  end

  def create
    # TODO 3443: Do not allow more than 1 review for a movie per user
    @review = Review.create(review_params)
    @movie = Movie.find(params[:movie_id])
    @review.movie = @movie
    @review.user = current_user
    if @movie.save
      if @review.save
        redirect_to controller: :movies, action: :all
      else
        render "new"
      end
    else
      render "new"
    end
  end

  def update
    @review = Review.find(params[:id])
    redirect_to controller: 'movies', action: 'all' unless @review.user_id == current_user.id
    @review.update(review_params)
    if @review.save
      redirect_to controller: :movies, action: :all
    else
      render "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to controller: :movies, action: :all
  end

  private

  def review_params
    params.require(:review).permit!
  end
end
