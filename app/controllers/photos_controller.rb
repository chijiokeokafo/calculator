class PhotosController < ApplicationController
load_and_authorize_resource
# before_filter :require_login, except: [:index]
  
  def index 
    @photo = if params[:search]
      Photo.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else 
      Photo.all
    end 


    if params[:photo_category_id]
      @photo = @photo.where(photo_category_id: params[:photo_category_id])
    end

    respond_to do |format|
      format.html
      format.js
    end 
  end

  def show
    @photo = Photo.find(params[:id])

    if current_user
      @review = @photo.reviews.build
    end 
  end 

  def new 
    @photo = Photo.new
  end 

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user

    if @photo.save
      redirect_to photo_url(@photo), notice: "photo has been uploaded"
    else 
      flash.now[:alert] = "Some error occured, retry submitting the photo" 
      render :new 
    end 
  end 
  
  def edit 
    @photo = Photo.find(params[:id])
  end 

  def update
    @photo = Photo.find(params[:id])
    
    if @photo.update_attributes(photo_params)
      redirect_to photo_path(@photo)
    else 
      flash.now[:alert] = "Some error occured, retry edditing the photo"
      render :edit
    end 
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_url
  end 

  private
  def photo_params
    params.require(:photo).permit(:name, :description, :photo_category_id, :avatar, :avatar_cache)
  end 

end
