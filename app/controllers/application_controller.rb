class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include LinkInHeaderHelper
  include FeedbacksHelper  		  
end
