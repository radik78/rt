class CreateTorrentLinks < ActiveRecord::Migration
  def change
    create_table :torrent_links do |t|
      t.string :desc

      t.timestamps
    end
  end
end
