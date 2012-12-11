class TorrentLinkController < ApplicationController
 

  def index
    @torrent_links = TorrentLink.all
  end

  def new
  	@torrent_link = TorrentLink.new
  end

  def create
      debugger
      @torrent_link = TorrentLink.create( params[:torrent_link] )
  end	
  




  def upload
  end

end
