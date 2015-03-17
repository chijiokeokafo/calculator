class BuildsController < ApplicationController
	def index
		@builds = if params[:search]
      Build.where('LOWER(rim) LIKE LOWER(?) OR LOWER(hub) LIKE LOWER(?)', "%#{params[:search]}%", "%#{params[:search]}%")
    else
      Build.all
    end

    respond_to do |format|
      format.html
      format.js
    end
	end

	def show
	  @build = Build.find(params[:id])
	end

	def new
	  @build = Build.new 
	end

  def create
    @build = Build.new(build_params)
    if @build.save
      redirect_to builds_url
    else
      render :new
    end
  end

  def update
    @build = Build.find(params[:id])
      if @build.update_attributes(build_params)
        redirect_to build_path(@build)
      else
        render :edit
      end
  end

  def edit
    @build = Build.find(params[:id])
  end

  def destroy
    @build = Build.find(params[:id])
      @build.destroy
      redirect_to builds_path
    end


  private
  
  def build_params
    params.require(:build).permit(:rim, :hub, :erd, :flange_diameter_left, :flange_diameter_right, :flange_center_left, :flange_center_right, :spoke_count, :spoke_hole_diameter, :spoke_crosses)
  end

end




 