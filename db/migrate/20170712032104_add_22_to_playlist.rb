class Add22ToPlaylist < ActiveRecord::Migration
  def change
    add_column :playlists, :image2, :string
  end
end
