class SessionsController < ApplicationController
	def create
		if User.identificate(params[:user][:email])
			@message = 'Welcome'
		else
			@message = 'ffff'
		end
	end
	
end
