class TorrentLink < ActiveRecord::Base

	belongs_to :user
	attr_accessible :file
	has_attached_file :file
end
# == Schema Information
#
# Table name: torrent_links
#
#  id                :integer         not null, primary key
#  desc              :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  user_id           :integer
#

