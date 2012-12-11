class AddAttachmentFileToTorrentLinks < ActiveRecord::Migration
  def self.up
    change_table :torrent_links do |t|
      t.has_attached_file :file
    end
  end

  def self.down
    drop_attached_file :torrent_links, :file
  end
end
