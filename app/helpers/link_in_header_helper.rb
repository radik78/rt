#encoding: utf-8
module LinkInHeaderHelper
	def link_hash


    #1 создаем  массив хэшей:   | ключ | текст ссылки | путь ссылки |
        all_links = 
        [
            { :text=> 'Вход',                   :path => :new_session },
            { :text=> 'Читать сообщения',       :path => :messages },
            { :text=> 'Создать сообщение',      :path => :new_message },
            { :text=> 'Регистрация',            :path => :new_user }
        ]





           #2 создаем массив:  | ключ| на основе текста ссылки
        req = request.fullpath
        need_links = []
        
        need_links <<'Регистрация'			  	if req == '/sessions/new'  	# ввод логина и пароля
        need_links <<'Вход' 				 	if req == '/users/new'		# регистрация
        need_links <<'Создать сообщение'  		if req == '/messages'		# все сообщения
        need_links <<'Читать сообщения'  		if req == '/messages/new'	# новое сообщение


        #3 создаем массив хэшей с линками
        arr_data_link = []
        need_links.reverse_each do |need|
            arr_data_link <<  all_links.detect {|e| e[:text]==need}
        end
		
		return arr_data_link	

	end

end








