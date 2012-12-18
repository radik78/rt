#encoding: utf-8


require 'spec_helper'


describe  "User Pages" do
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


	describe do
		it "auto capitalize first char" do
			fill_in :user_name, with: "small first letter"
			click_button "создать"
			user = User.last
			user.name.should == "Small first letter"
		end
	end

	
end