#encoding: utf-8
class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
	@user = User.new
  end


  def create
	@user = User.new params[:user]
	@user.debpassword = params[:user][:password]
	if @user.save
		@message = 'congratulations! you saved in database!'
    flash[:success] = 'примите поздравления! Теперь Вы можете...'
    sign_in(@user)
    redirect_to messages_path
	else
		@message = '! trobble in database (probably, uncorrect parametrs of user) !'
    flash[:error] = '! trobble in database (probably, uncorrect parametrs of user) !'
    redirect_to new_user_path
	end
  end


  def edit
  end

  def update
  end

  def destroy
  end

end
