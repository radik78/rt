#encoding: utf-8


class TorrentLinksController < ApplicationController

  before_filter :check_access   #, :only => [:index, :new, :create] 

  def index
    @torrent_links = TorrentLink.all
    @title = 'Обзор торрент ссылок'
  end

  def new
  	@torrent_link = TorrentLink.new
    @title = 'Загрузите свою торрент ссылку'
  end

  def create
      # debugger
      #if torrent_link = @current_user.torrent_links.create(params[:torrent_link])
        torrent_link = @current_user.torrent_links.new(params[:torrent_link])
        torrent_link.desc = params[:torrent_link][:desc]  #??? почему то приходится этот параметр дописывать в базу вручную
        if torrent_link.save
         flash[:success] = "#{@current_user.name}, вашa торрент cсылка была добавлена"
        redirect_to :torrent_links
      end   

  end	
  




  def upload
  end

end
