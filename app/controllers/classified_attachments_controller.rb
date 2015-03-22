class ClassifiedAttachmentsController < ApplicationController
  load_and_authorize_resource

def show
   @classified_attachments = @classified.classified_attachments.all
end

def new
   @classified = Classified.new
   @classified_attachment = @classified.classified_attachments.build
end

def create
  @classified = Classified.new(classified_params)

   respond_to do |format|
     if @classified.save
       params[:classified_attachments]['picture'].each do |a|
          @classified_attachment = @classified.classified_attachments.create!(:picture => a, :classified_id => @classified.id)
       end
       format.html { redirect_to @classified }
     else
       format.html { render action: 'new' }
     end
   end
end

def update
   respond_to do |format|
     if @classified.update(classified_params)
       params[:classified_attachments]['picture'].each do |a|
         @classified_attachment = @classified.classified_attachments.create!(:picture => a, :classified_id => @classified.id)
       end
     end
  end
end  

  def destroy
    @classified.destroy
    respond_to do |format|
      format.html { redirect_to @classified }
      format.json { head :no_content }
    end
  end


 private
   def classified_params
      params.require(:classified).permit(:title, :description, :amount, :email, :city, :image, :image_cache, post_attachments_attributes: [:id, :post_id, :avatar])
   end


end
