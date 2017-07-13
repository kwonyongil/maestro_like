class AddS3ToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :writer, :string
  end
end
