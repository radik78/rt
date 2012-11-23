#encoding: utf-8

class SessionsController < ApplicationController
	def create
		if User.identificate(params[:user][:email], params[:user][:password])
			user = User.find_by_email(params[:user][:email])
			flash[:success] = "#{user.name}, вы успешно зашли на сайт!"
		else
			flash[:error] = '! вы ввели неверный пароль или e-mail'
			redirect_tog :home
		end

	end
	
end
