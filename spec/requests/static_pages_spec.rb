require 'spec_helper'

describe "StaticPages" do
  describe "page home" do
    it "will be responsed by 200 (ok)" do
      	visit '/sessions/new'
      	response.status.should be(200)
    end
  end
end
