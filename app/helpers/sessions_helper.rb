#encoding: utf-8

module SessionsHelper
	
  	

  	# открывает сессию
  	def sign_in(user)
  		session[:remember_token] = [:id => user.id, :salt=>user.salt]
  	end


    # закрывает сессию
    def sign_out
      session[:remember_token] = nil
      @current_user = nil 
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

    def user_signed?
        @current_user
    end



    def check_access
      if !(find_user_by_id_and_salt)
          flash[:error]='вы не можете это сделать, т.к. не прошли аутентификацию'  
        redirect_to(:home)
      end  
    end  

end
