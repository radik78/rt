# Используя символ ':user', мы указываем Factory Girl на необходимость симулировать модель User.
#Factory.define :user do |user|
#  user.name                  "Michael Hartl"
#  user.email                 "mhartl@example.com"
 # user.password              "foobars"
 # user.password_confirmation "foobars"
#end


Factory.define :torrent do |torrent|
	torrent.filename     'superfile'
	torrent.content_type "X'746578742F68746D6C'"
	torrent.data         'a'*320
	torrent.description  'aefqcq34fefq34fqedfqrgqedfq34fqdwf'
	torrent.association :user
end


Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end