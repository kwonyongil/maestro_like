class AddImageToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :image, :string
    add_column :playlists, :name, :string
  end
end
