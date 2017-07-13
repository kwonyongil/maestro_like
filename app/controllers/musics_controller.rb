class MusicsController < ApplicationController
  def music
    @playlist = Playlist.new
  end
  
  
  def playlist
    @playlists= Playlist.where(:user_id => current_user.id)
  end
end


