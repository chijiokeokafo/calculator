class PostersController < ApplicationController
def show
    @poster = Poster.find(params[:id])
  end

  def create
    @classified = Classified.find(params[:classified_id])
    @poster = @classified.posters.build(poster_params)
    @poster.user = current_user

    if @poster.save
      redirect_to classified_url(@classified), notice: 'Your post was created successfully'
    else
      flash.now[:alert] = "An error occured, resubmit please" 
      render 'classifieds/show'
    end 
  end

  def destroy
    @poster = Poster.find(params[:id])
    @poster.destroy
  end

private
  def poster_params
    params.require(:poster).permit(:messsage, :email, :name)
  end
end
