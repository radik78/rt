class AddUserIdToTorrentLinks < ActiveRecord::Migration
  def change
    add_column :torrent_links, :user_id, :integer
  end
end
