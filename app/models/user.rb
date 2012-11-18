class User < ActiveRecord::Base

	attr_accessor :password

	validates :password,
		:presence => true,
		:confirmation => true,			# that automaticale create password_confirmation attribute
		:length => {:within => 6..40}




	# проверяет, существует ли такой емэйл и пароль
	def self.identificate(email, password)
		user = User.find_by_email(email)
		if (!user.nil?)
			if(User.encrypted_word(password, user.salt)==user.encrypted_pass)
				return user
			end
		end
		return nil
	end


	# сохраняет пользователя, создав перед этим соль и хэш пароля
	def save_in_database
		self.salt = User.salt_generate(self.password)
		self.encrypted_pass = User.encrypted_word(self.password, self.salt)
		self.save
	end
   	

	
	private

		# генерирует соль на основе какого либо слова и текущего времени
		def self.salt_generate( any_word)
	 		return Digest::SHA2.hexdigest("#{Time.now.utc}-89f-#{any_word}")
		end
	
			# шифрует слово на основе соли
		def self.encrypted_word (word, salt)
			return Digest::SHA2.hexdigest("#{salt}-89f-#{word}")
		end


end
