#encoding: utf-8


class TorrentsController < ApplicationController

  before_filter :check_access   #, :only => [:index, :new, :create] 

  def show
  	@torrent = Torrent.find(params[:id])
    if @torrent
      send_data @torrent.data, :filename => @torrent.filename, :type => @torrent.content_type
    else
      flash[:error] = 'файл с таким id отсутствует в базе'
      redirect_to torrents_path
    end  
   
  end

  def new
    @torrent = Torrent.new
    @title = 'Загрузка торрент-файла в базу РТ-95-2'
  end


  def create
  	  	
  	@torrent  = @current_user.torrents.new
  	@torrent.uploaded_file = params[:torrent]
  	if @torrent.save
      flash[:success] = 'торрет файл успешно сохранен в базе'
      redirect_to torrents_path
    else
      flash.now[:error] = 'при сохранении файла в базу возник ужасный трабл'
      @title = 'Загрузка торрент-файла в базу РТ-95-2'
      render new_torrent_path

    end  
  end


  def index
  	@torrents  = Torrent.all
    @title = 'Обзор торрент ссылок'
  end

end
