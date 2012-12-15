class AddDetailsToTorrents < ActiveRecord::Migration
  def change
    add_column :torrents, :user_id, :integer
    add_column :torrents, :description, :text
  end
end
