class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.create(review_params)
    @movie = Movie.find(params[:movie_id])
    @review.movie = @movie
    if @review.save
      redirect_to controller: :movies, action: :all
    else
      render "new"
    end
  end

  def update
    @review = Review.find(params[:id])
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
