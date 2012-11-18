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
	if @user.save_in_database
		@message = 'congratulations! you saved in database!'
	else
		@message = '! trobble in database (probably, uncorrect parametrs of user) !'
	end
  end


  def edit
  end

  def update
  end

  def destroy
  end

end
