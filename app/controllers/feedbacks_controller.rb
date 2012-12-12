#encoding: utf-8

class FeedbacksController < ApplicationController
  def index
  	  @feedbacks = Feedback.all
      @title = 'Замечания по проекту'
  end

  def create
  	@feedback = Feedback.new(params[:feedback])
  	if @feedback.save
   	 	flash[:success] = 'спасибо, что поддержали проект'
	end
    redirect_to messages_path
  end

end
