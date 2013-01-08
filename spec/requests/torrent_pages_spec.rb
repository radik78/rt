#encoding: utf-8


require 'spec_helper'


describe  "Torrent Pages" do




	before(:each) do
		visit new_user_path

		fill_in :user_name, with: "Example User"
		fill_in :user_email, with: "ExampleUser@mail.com"
		fill_in :user_password, with: "qwerqwer"
		fill_in :user_password_confirmation, with: "qwerqwer"
	end

	describe "delete link"	 do
		it "should have admin" do
			  visit torrents_path
			  response.should have_selector 'a', :text=>'удалить'
		end
	end

end