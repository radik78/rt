require 'spec_helper'

describe User do

 
  before{ @user = User.new(name: "Example User", email: "user@example.com", password: "12341234", password_confirmation:"12341234") }

  subject { @user }



  it { should respond_to(:name) }
  it { should respond_to(:email) }


  describe ": when name is not present" do
  	before { @user.name = ''} 
  	it "it be do not valid " do
  		@user.should_not be_valid 
  	end
  end	

 describe "when lenght of name is" do
 	it "more then 40, it be not valid" do
 		@user.name = 'd'*41
 		@user.should_not be_valid
 	end

 	it "less  then 41, it be valid" do
 		@user.name = 'd'*40
 		@user.should be_valid
 	end

	it "less  then 2, it be not valid" do
 		@user.name = 'd'
 		@user.should_not be_valid
 	end

  it "debug factory" do
    user = Factory(:user)
  end

 end




end



# == Schema Information
#
# Table name: users
#
#  id             :integer         not null, primary key
#  email          :string(255)
#  name           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  encrypted_pass :string(255)
#  salt           :string(255)
#  debpassword    :string(255)
#

