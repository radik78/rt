#coding: utf-8
class SessionsController < ApplicationController
	def create
		if User.identificate(params[:user][:email], params[:user][:password])
			@message = 'Welcome'
		else
			flash[:error] = 'неверный пароль или логин (эту часть надо переделать)'
			@message = 'неверный пароль или логин (эту часть надо переделать)'
		end
	end
	
end
