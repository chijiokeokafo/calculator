class ClassifiedsController < ApplicationController


  def index 
    @classifieds = if params[:search]
      Classified.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%")
    else 
      Classified.all
    end 

    respond_to do |format|
      format.html
      format.js
    end 
  end

  def new
    @classified = Classified.new
    @classified_attachments = @classified.classified_attachments.build
  end

  def show
    @classified = Classified.find(params[:id])
    @classified_attachments = @classified.classified_attachments

    if current_user
      @poster = @classified.posters.build
    end
  end


  def create
    @classified = Classified.new(classified_params)
    @classified.user = current_user

    if @classified.save
      params[:classified_attachments]['picture'].each do |a|
          @classified_attachment = @classified.classified_attachments.create!(:picture => a, :classified_id => @classified.id)
      end
      redirect_to classified_url(@classified), notice: "Your ad has been added"
    else
      flash.now[:alert] = "Error occured"
      render :new
    end 
  end 

  def edit
    @classified = Classified.find(params[:id])
    @classified_attachments = @classified.classified_attachments.build
  end
    
  def update
    @classified = Classified.find(params[:id])
    if @classified.update_attributes(classified_params)
      redirect_to classified_path(@classified)
    else
      flas.now[:alert] = "Error occured"
      render :edit
    end
  end 

  def destroy
    @classified = Classified.find(params[:id])
    @classified.destroy
    redirect_to root_url
  end 

private 

def classified_params
  params.require(:classified).permit(
    :title,
    :description,
    :amount,
    :email,
    :city,
    :address,
    :latitude,
    :longitude,
    :image,
    :image_cache,
    classified_attachments_attributes: [
      :id,
      :classified_id,
      :picture,
      :_destroy
    ]
  )
end  

end
