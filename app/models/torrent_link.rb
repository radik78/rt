class TorrentLink < ActiveRecord::Base

	attr_accessible :file
	has_attached_file :file
end
