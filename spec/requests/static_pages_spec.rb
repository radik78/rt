#encoding: utf-8

require 'spec_helper'



describe "StaticPages" do
  
  describe "page home" do

    it "will be have selectors" do
      visit '/sessions/new'
      response.should have_selector('title', :content => "Rt")
      response.should have_selector('a', :content => "Регистрация")
      
    end


    it "will be responsed by 200 (ok)" do
        visit '/sessions/new'
        response.status.should be(200)  
    end



  end
end

