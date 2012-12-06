#encoding: utf-8


require 'spec_helper'


describe  "Messages Pages" do




	before(:each) do
		visit new_user_path

		fill_in :user_name, with: "Example User"
		fill_in :user_email, with: "ExampleUser@mail.com"
		fill_in :user_password, with: "qwerqwer"
		fill_in :user_password_confirmation, with: "qwerqwer"
	end

	describe "Signup: succesfull registration" do

		it "maked a new user" do
			expect do
				click_button "создать"
			end.to change(User, :count).by(1)
		end
	end

	describe "Signup: unsuccesfull registration" do
		it "not maked a new user" do
			fill_in :user_password_confirmation, with: "foooooo"
			lambda do
				click_button "создать"
			end.should_not change(User, :count)
		end
	end

	describe "foo" do	
		it "asdf" do

	#		user = Factory(:user)
		end
	end	





end


# неаутентифицированный пользователь не должен иметь доступ к некоторым страницам:
#  - ко всем сообщениям

describe "Доступ" do
	describe " не получен, если пользователь не аутентифицирован" do
		
		it do
			visit new_message_path
			response.should  render_template "sessions/new"
		end	

		it do
			visit messages_path
			response.should  render_template "sessions/new"
		end

	end


	describe "получен для аутентифицированного пользователя на страницу" do
		
		before(:each) do 
			@user = Factory :user
			integration_sign_in(@user)
		end

		it "списка всех сообщений" do
			visit messages_path
			response.should  render_template "messages"
			
		end	

		it "создания нового сообщения" do
			visit new_message_path
			response.should  render_template "messages/new"
		end

	end

end