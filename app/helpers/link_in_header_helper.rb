#encoding: utf-8
module LinkInHeaderHelper
	def link_hash


    #1 создаем  массив хэшей:   | ключ | текст ссылки | путь ссылки |
        all_links = 
        [
            { :text=> 'Вход',                   :path => :new_session },
            { :text=> 'Читать сообщения',       :path => :messages },
            { :text=> 'Создать сообщение',      :path => :new_message },
            { :text=> 'Регистрация',            :path => :new_user },
            { :text=> 'Разместить торрент',     :path => :new_torrent_link },
            { :text=> 'Все торретны',           :path => :torrent_links }
        ]




           #2 создаем массив:  | ключ| на основе текста ссылки

        need_links = []
        need_links <<'Читать сообщения' <<'Создать сообщение' <<'Регистрация' <<'Разместить торрент' <<'Все торретны' 


        req = request.fullpath
        deny_links = []
        deny_links <<'Вход'                        if req == '/sessions/new'   # ввод логина и пароля
        deny_links <<'Регистрация'                 if req == '/users/new'      # регистрация
        deny_links <<'Читать сообщения'            if req == '/messages'       # все сообщения
        deny_links <<'Создать сообщение'           if req == '/messages/new'   # новое сообщение
        deny_links <<'Разместить торрент'          if req == '/torrent_links/new'       # все сообщения
        deny_links <<'Все торретны'                if req == '/torrent_links'   # новое сообщение

        if !user_signed?
            deny_links <<'Читать сообщения'<<'Создать сообщение'<<'Разместить торрент'<<'Все торретны'
        else
            deny_links <<'Вход'<<'Регистрация'
        end


        deny_links.each do |deny|
          need_links.delete   deny
        end

        
        #3 создаем массив хэшей с линками
        arr_data_link = []
        need_links.reverse_each do |need|
            arr_data_link <<  all_links.detect {|e| e[:text]==need}
        end
		
		return arr_data_link	

	end

    

end








