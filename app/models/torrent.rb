class Torrent < ActiveRecord::Base
	belongs_to :user


	validates :data,
		:presence => true,
		:confirmation => true,			# that automaticale create password_confirmation attribute
		:length => {:within => 300..60.kilobytes}


	def uploaded_file=(params)
		#debugger
		self.filename = params[:file].original_filename
		self.content_type = params[:file].content_type
		self.data = params[:file].read
	end


 	def filename=(new_filename)
        write_attribute("filename", sanitize_filename(new_filename))
    end

    private #----------------------------------------------------------------

    def sanitize_filename(filename)
        #get only the filename, not the whole path (from IE)
        just_filename = File.basename(filename)
        #replace all non-alphanumeric, underscore or periods with underscores
        just_filename.gsub(/[^\w\.\-]/, '_')
    end

end



# == Schema Information
#
# Table name: torrents
#
#  id           :integer         not null, primary key
#  filename     :string(255)
#  content_type :string(255)
#  data         :binary
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#  description  :text
#

