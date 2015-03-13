class PostersController < ApplicationController
def show
    @poster = Poster.find(params[:id])
  end

  def create
    classified = Classified.find(params[:classified_id])
    recipient = classified.user

    @poster = classified.posters.build(poster_params)
    # binding.pry
    @poster.user = current_user

    if @poster.save
      UserMailer.notify_inquiry(classified, recipient, @poster).deliver_now
      redirect_to classified_url(classified), notice: 'Your post was created successfully'
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
    params.require(:poster).permit(:message, :email, :name)
  end
end
