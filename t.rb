#encoding: utf-8
		#1 создаем  массив хэшей: 	| ключ | текст ссылки | путь ссылки |
		all_links = 
		[
			{ :key => 'autorize', :text=> 'вход', :path => 'sessions/new' },
			{ :key => 'all_message', :text=> 'смотреть сообщения', :path => 'messages/index' }
		]



		#2 создаем массив:  | ключ| на основе текста ссылки
		#req = request.fullpath
		#if req == 'sessions/new'

		 need_links = ['autorize']



		#3 создаем массив хэшей с линками

		arr_data_link = []
		need_links.each do |need|
			arr_data_link <<  all_links.detect {|e| e[:key]==need}
		end

		puts arr_data_link