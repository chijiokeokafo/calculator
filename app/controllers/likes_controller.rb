class LikesController < ApplicationController
  load_and_authorize_resource
  
  def create
    @like = Like.find_or_create_by(user_id: current_user.id, photo_id: params[:photo])
    @like.save

    redirect_to photo_path(params[:photo])
  end

end
