class TorrentLinkController < ApplicationController
 

  def index
  end

  def new
  	@torrent_link = TorrentLink.new
  end

  def create

	  	file = params[:torrent_link][:file]
		File.open(Rails.root.join('app', 'assets/uploads', file.original_filename), 'wb') do |f|
  			f.write(file.read)
  		end
  end	
  




  def upload
  end

end
