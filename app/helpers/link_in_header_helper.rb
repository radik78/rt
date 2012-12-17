#encoding: utf-8

module LinkInHeaderHelper
	def link_hash


    #1 создаем  массив хэшей:   | ключ | текст ссылки | путь ссылки |
        all_links = 
        [
            { :text=> 'Главная',                :path => :new_session },
            { :text=> 'Читать сообщения',       :path => :messages },
            { :text=> 'Создать сообщение',      :path => :new_message },
            { :text=> 'Регистрация',            :path => :new_user },
            { :text=> 'Добавить торрент',       :path => :new_torrent },
            { :text=> 'Смотреть торренты',      :path => :torrents }
        ]




           #2 создаем массив:  | ключ| на основе текста ссылки

        need_links = []
        need_links <<'Читать сообщения' <<'Создать сообщение' <<'Регистрация' <<'Добавить торрент' <<'Смотреть торренты' 


        req = request.fullpath
        deny_links = []
        deny_links <<'Главная'              if req == '/sessions/new'   # ввод логина и пароля
        deny_links <<'Регистрация'          if req == '/users/new'      # регистрация
        deny_links <<'Регистрация'          if req == '/users'          # ошибка при регистрации
        deny_links <<'Читать сообщения'     if req == '/messages'       # все сообщения
        deny_links <<'Создать сообщение'    if req == '/messages/new'   # новое сообщение
        deny_links <<'Добавить торрент'     if req == '/torrents/new'   # все сообщения
        deny_links <<'Смотреть торренты'    if req == '/torrents'       # новое сообщение

        if !user_signed?
            deny_links                      \
                    <<'Читать сообщения'    \
                    <<'Создать сообщение'   \
                    <<'Добавить торрент'    \
                    <<'Смотреть торренты'
        else
            deny_links                      \
                    <<'Главная'             \
                    <<'Регистрация'
        end


        deny_links.each do |deny|
          need_links.delete   deny
        end

        
        #3 создаем массив хэшей с линками
        arr_data_link = []
        need_links.reverse_each do |need|
            arr_data_link <<  all_links.detect {|link| link[:text]==need}
        end
		
		return arr_data_link	

	end

    

end








