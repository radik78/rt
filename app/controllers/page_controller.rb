class PageController < ApplicationController
  def home
	@user = User.new
	respond_to do |format|
		format.html
		format.js {render :js=> "alert('hello');", :content_type=>'text/javascript'}
		format.json {render :json=>@user}
		format.xml  {render :xml=>@user}
	end
  end

end
