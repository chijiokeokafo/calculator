class BuildsController < ApplicationController
	def index
		@builds = Build.all
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

  def destroy
    @build = Build.find(params[:id])
      @build.destroy
      redirect_to builds_path
    end


  private
  
  def build_params
    params.require(:build).permit(:rim, :hub, :price_in_cents, :erd, :flange_diameter_left, :flange_diameter_right, :flange_center_left, :flange_center_right, :spoke_count, :spoke_hole_diameter, :spoke_crosses)
  end

end


 