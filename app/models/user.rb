# == Schema Information
#
# Table name: users
#
#  id             :integer         not null, primary key
#  email          :string(255)
#  name           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  encrypted_pass :string(255)
#  salt           :string(255)
#  debpassword    :string(255)

class User < ActiveRecord::Base

	has_many  :messages
	attr_accessor :password

	validates :password,
		:presence => true,
		:confirmation => true,			# that automaticale create password_confirmation attribute
		:length => {:within => 6..40}

	validates :name,
		:presence => true,
		:length => {:within => 2..40}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email,
		:presence    => true,
		:format      => { :with => VALID_EMAIL_REGEX },
		:uniqueness  => { :case_sensitive => false}

	before_save :make_encrypt_password_and_salt


	# проверяет, существует ли такой емэйл и пароль
	def self.identificate(email, password)

		@global_message = 'asdfasdf'
		user = User.find_by_email(email)
		if (!user.nil?)
			if(User.encrypted_word(password, user.salt)==user.encrypted_pass)
				return 'ok'
			end
		end
		return user.name+'===='+User.encrypted_word(password, user.salt)+'====='+user.encrypted_pass
	end


	# создает соль и хэш пароля (используется автоматически перед сохранением)
	def make_encrypt_password_and_salt
		self.salt = User.salt_generate(self.password)
		self.encrypted_pass = User.encrypted_word(self.password, self.salt)
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



