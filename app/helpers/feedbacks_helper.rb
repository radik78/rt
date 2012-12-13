module FeedbacksHelper
	
	def new_feedback
		@feedback = Feedback.new
		@feedback.urlpage = request.fullpath
	end	

end
