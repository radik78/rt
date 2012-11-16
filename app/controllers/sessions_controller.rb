#coding: utf-8
class SessionsController < ApplicationController
	def create
		if User.identificate(params[:user][:email])
			@message = 'Welcome'
		else
			@message = 'неверный пароль или логин (эту часть надо переделать)'
		end
	end
	
end
