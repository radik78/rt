#encoding: utf-8

class TorrentLinksController < ApplicationController
 

  def index
    @torrent_links = TorrentLink.all
    @title = 'Обзор ссылок'
  end

  def new
  	@torrent_link = TorrentLink.new
    @title = 'Загрузите свою торрент ссылку'
  end

  def create
      debugger
      @torrent_link = TorrentLink.create( params[:torrent_link] )
      @title = 'Торрент, возможно, загружен'
  end	
  




  def upload
  end

end
