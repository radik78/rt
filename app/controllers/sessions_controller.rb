#encoding: utf-8

class SessionsController < ApplicationController

	def new
		@user = User.new
		d = request.fullpath
		respond_to do |format|
		format.html
		format.js {render :js=> "alert('hello');", :content_type=>'text/javascript'}
		format.json {render :json=>@user}
		format.xml  {render :xml=>@user}
	end
		
	end


	def create
		@global_message = User.identificate(params[:user][:email], params[:user][:password]) 
		if @global_message == 'ok'
			user = User.find_by_email(params[:user][:email])
			sign_in(user)
			flash[:success] = "#{user.name}, вы успешно зашли на сайт!"
			redirect_to messages_path
		else
			user = User.find_by_email(params[:user][:email])
			flash[:error] = "! =============================  #{@global_message}"
			#redirect_to new_session_path
			redirect_to new_session_path
		end

	end

	def destroy
		
	end
	

end
