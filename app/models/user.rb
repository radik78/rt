class User < ActiveRecord::Base

	def self.identificate(email)
		user = User.find_by_email(email)
		return user
	end
end
