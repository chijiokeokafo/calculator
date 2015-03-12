class ClassifiedsController < ApplicationController

  def index 
    @classified = Classified.all
  end 

  def new
    @classified = Classified.new
  end

  def show
    @classified = Classified.find(params[:id])
  end

  def create
    @classified = Classified.new(classified_params)

    if @classified.save
      redirect_to classified_url(@classified), notice: "Your ad has been added"
    else
      flash.now[:alert] = "Error occured"
      render :new
    end 
  end 

  def edit
    @classified = Classified.find(params[:id])
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
  params.require(:classified).permit(:title, :description, :amount, :email, :city, :picture, :picture_cache)
end  

end
