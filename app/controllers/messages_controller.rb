class MessagesController < ApplicationController
  def index
	   @messages = Message.order('updated_at DESC').limit 2
	   #@messages = Message.all
  end

  def show
  end

  def new
	 @message = Message.new
  end

  def create
	 message = Message.new(params[:message])
   if message.save
    flash[:notice] = 'сообщение было добавлено'
	  redirect_to messages_path

  end


  def edit
  end

  def update
  end

  def destroy
  end

end
