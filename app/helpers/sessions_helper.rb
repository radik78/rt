module SessionsHelper
	
	attr_accessor  :signed_in, :debug_def


	def signed_in
		#@current_user = 'asdfasdfasdf'
		return @current_user
	end

	# открывает сессию
	def sign_in(user)
		session[:remember_token] = [:id => user.id, :salt=>user.salt]
	end

	def find_user_by_id_and_salt
		if session[:remember_token]
	    	@current_user = User.find_by_id(session[:remember_token][0][:id])
	    end	
      	(@current_user && @current_user.salt == session[:remember_token][0][:salt]) ? @current_user : nil
      	@current_user = '1123456'
    end 

    def get_session
     	session[:remember_token][0]
    end 

    def debug_def
    	@current_user = 'd4'
    end

    def print_status
    	@current_user ? 'Loged' : 'Non loged'
    end

end
