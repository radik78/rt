#encoding: utf-8


require 'spec_helper'


describe  "In page 'torrents/index'" do





	describe "delete link"	 do


		#before(:each) do
		#	visit new_user_path
		#
		#	fill_in :user_name, with: "Example User"
		#	fill_in :user_email, with: "ExampleUser@mail.com"
		#	fill_in :user_password, with: "qwerqwer"
		#	fill_in :user_password_confirmation, with: "qwerqwer"
		#	click_button "создать"
		#end

		before(:each) do
			# create non admin user and create her torrent
			@usual_user = Factory(:user, email: 'usual_user@mail.ru')	# создали пользователя в базе данных
			Factory(:torrent, user: @usual_user)							# created torrent in database
		end


		it "should be, if user is admin" do

			# create admin user and sign in him
			user_admin = Factory(:user, admin: true)						# создали пользователя в базе данных
			integration_sign_in(user_admin)									# пользователь вошел на сайт (sign in)

			visit torrents_path
			response.should have_selector 'a', :content=>'удалить'
		end


		it "don't should be, if user is not admin" do
			# create non admin user and create her torrent
			user = Factory(:user, admin: false)								# создали пользователя в базе данных
			integration_sign_in(user)										# пользователь вошел на сайт (sign in)

			visit torrents_path
			response.should_not have_selector 'a', :content=>'удалить'
		end


		it "should be, if torrent belongs to this user" do
						
			integration_sign_in(@usual_user)								# пользователь вошел на сайт (sign in)

			visit torrents_path
			response.should have_selector 'a', :content=>'удалить'
		end



	end

end