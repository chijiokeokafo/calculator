class ReviewsController < ApplicationController
  load_and_authorize_resource

  def show
    @review = Review.find(params[:id])
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @review = @photo.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to photo_url(@photo), notice: 'Review was created successfully'
    else
      flash.now[:alert] = "Some error occured, retry submitting your review again" 
      render 'photos/show'
    end 
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

private
  def review_params
    params.require(:review).permit(:comment, :photo_id)
  end

end
