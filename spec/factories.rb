# Используя символ ':user', мы указываем Factory Girl на необходимость симулировать модель User.
Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobars"
  user.password_confirmation "foobars"
end

#Factory.sequence :email do |n|
#  "person-#{n}@example.com"
#end

#Factory.define :micropost do |micropost|
#	micropost.content "Foo bar"
#	micropost.association :user
#end
