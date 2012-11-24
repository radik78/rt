#encoding: utf-8
class MessagesController < ApplicationController

   before_filter :autenticate_user, :only => [:new, :create]

   def index
	   @messages = Message.order('updated_at DESC').limit 8
	   #@messages = Message.all
   end

   def show
    
   end

   def new
      #flash[:notice] = get_session
	   @message = Message.new
   end

   def create
      message = Message.new(params[:message])
      message.user_id = @current_user.id
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
      #a = session[:remember_token]
      #flash[:error]=  = session[:remember_token][0][:id]
      if !(@current_user = find_user_by_id_and_salt)
         flash[:error]='вы не можете создавать сообщения, т.к. не прошли аутентификацию'  
         redirect_to(:home)
      end
   end

end
