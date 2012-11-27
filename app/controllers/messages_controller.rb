#encoding: utf-8
class MessagesController < ApplicationController

   before_filter :autenticate_user, :only => [:new, :create, :index]

   def index
	   @messages = Message.order('updated_at DESC').limit 8
   end

   def show
    
   end

   def new
	   @message = Message.new
      @title = 'Новое сообщение'
   end

   def create
      @current_user.message = Message.new(params[:message])
      if message.save
         flash[:notice] = "сообщение было добавлено #{message.user_id}"
	      redirect_to messages_path
      end   
    end


   def edit
   end

   def update
   end

   def destroy
   end

   # ---- filters ------------------------------

   

   def autenticate_user
      if !(find_user_by_id_and_salt)
         flash[:error]='вы не можете создавать сообщения, т.к. не прошли аутентификацию'  
         redirect_to(:home)
      end
   end

end
