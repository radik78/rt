module SessionsHelper
	
	attr_accessor :current_user

	def sign_in(user)
		session[:remember_token] = [:id => user.id, :salt=>user.salt]
	end

	def find_user_by_id_and_salt
		if session[:remember_token][0][:id]
	    	user = User.find_by_id(session[:remember_token][0][:id])
	    end	
      	(user && user.salt == session[:remember_token][0][:salt]) ? user : nil
    end 

    def get_session
     	session[:remember_token][0]
     end 

end
