class LikesController < ApplicationController

  def create
    # binding.pry
    @like = Like.find_or_create_by(user_id: current_user.id, photo_id: params[:photo])
    @like.save

    # if @like.save
    # end

    # respond_to do |format|
    #   format.html
    #   format.js
    # end
    redirect_to photo_path(params[:photo])
  end

end
