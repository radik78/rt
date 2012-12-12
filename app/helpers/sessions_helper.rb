#encoding: utf-8

module SessionsHelper
	
  	#attr_accessor  :signed_in

  	# проверяет сессию
  	def signed_in
  		return @current_user
  	end

  	# открывает сессию
  	def sign_in(user)
  		session[:remember_token] = [:id => user.id, :salt=>user.salt]
  	end

  	def find_user_by_id_and_salt
  		if session[:remember_token] && 	user = User.find_by_id(session[:remember_token][0][:id])
        	user = (user.salt == 	session[:remember_token][0][:salt] ? 	user : nil)
        	@current_user = user	
      end 
    end 

    def get_session
       	session[:remember_token][0]
    end 


    def print_status_sign
      	@current_user  ? "Доброго времени суток, #{@current_user.name}! " : "Non loged"
    end


    def check_access
      if !(find_user_by_id_and_salt)
          flash[:error]='вы не можете создавать сообщения, т.к. не прошли аутентификацию'  
        redirect_to(:home)
      end  
    end  

end
