class User < ActiveRecord::Base

	attr_accessor :password

	validates :password,
		:presence => true,
		:confirmation => true,			# that automaticale create password_confirmation attribute
		:length => {:within => 6..40}

	# проверяет, существует ли такой емэйл и пароль
	def self.identificate(email)
		user = User.find_by_email(email)
		return user
	end

	# шифрует слово на основе соли
	def encrypted_word (word, salt)
		return Digest::SHA2.hexdigest("#{salt}-89f-#{word}")
	end

	# генерирует соль на основе какого либо слова и текущего времени
	def salt_generate( any_word)
 		return Digest::SHA2.hexdigest("#{Time.now.utc}-89f-#{any_word}")
	end

	def save_in_database
		self.salt = salt_generate(self.password)
		self.encrypted_pass = encrypted_word(self.password, self.salt)
		self.save
	end

	
	
end
