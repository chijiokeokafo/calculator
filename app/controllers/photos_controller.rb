class PhotosController < ApplicationController

	def index 
		@photo = Photo.all
	end

	def show
		@photo = Photo.find(params[:id])

	end 

	def new 
		@photo = Photo.new
	end 

	def create
		@photo = Photo.new(photo_params)

		if @photo.save
			redirect_to photo_url(@photo), notice: "photo has been uploaded"
		else 
			flash.now[:alert] = "Some error occured, retry submitting the project" 
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
		redirect_to root_url
	end 

	private
	def photo_params
		params.require(:photo).permit(:name, :description)
	end 

end
