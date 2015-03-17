class SessionsController < ApplicationController
	skip_before_filter :require_login, except: [:destroy]

	def index
		render 
	end

	def new
		render text: 
	end

	def create
		render text: 
	end

	def destroy
		render text: 
	end
end
