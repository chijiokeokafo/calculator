class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end 

  def create
    if @user = login(params[:email], params[:password], params[:remember])
      redirect_back_or_to(photos_url, notice: 'Login Successful!')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end 
  end 

  def destroy
    logout 
    redirect_to photos_url, notice: 'Logged out!'
  end 
end
