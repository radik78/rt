#encoding: utf-8
class MessagesController < ApplicationController


   before_filter :check_access   #, :only => [:index, :new, :create]

   def index
	   @messages = Message.order('updated_at DESC').limit 8
      @title = 'Сообщения'
   end

   def show
    
   end

   def new
	   @message = Message.new
      @title = 'Новое сообщение'
   end

   def create
      if message = @current_user.messages.create(params[:message])
         flash[:notice] = "#{message.user.name}, ваше сообщение было добавлено"
	      redirect_to messages_path
      end   
    end


   def edit
   end

   def update
   end

   def destroy
   end

end
