class PlaylistsController < ApplicationController
    def create
        @playlist = Playlist.new(playlist_params)
        @playlist.save
                                                                                                          
        @music = ['0','0','0','0','0','0','0','0','0','0','0','0','0','0']  
        @music_2 = ['0','0','0','0','0','0','0','0','0','0','0','0','0','0']
        @music_3 = ['0','0','0','0','0','0','0','0','0','0','0','0','0','0']  
        for i in 0..14
          @music[i] = Music.new
        end
        for i in 0..14
          @music_2[i] = Music.new
        end
        for i in 0..14
          @music_3[i] = Music.new
        end
        for i in 0..14      
          @audio_name = "audio_name" + i.to_s
          @audio_volume = "audio_volume" + i.to_s
          @audio_onoff = "audio_onoff" + i.to_s
          @music[i].name = params[:playlist][@audio_name]
          @music[i].volume = params[:playlist][@audio_volume].to_f
          @music[i].onoff = params[:playlist][@audio_onoff]
          @music[i].playlist_id = @playlist.id
          @music[i].save
        end
        for i in 0..14      
          @audio_name = "audio_name_2_" + i.to_s
          @audio_volume = "audio_volume_2_" + i.to_s
          @audio_onoff = "audio_onoff_2_" + i.to_s
          @music_2[i].name = params[:playlist][@audio_name]
          @music_2[i].volume = params[:playlist][@audio_volume].to_f
          @music_2[i].onoff = params[:playlist][@audio_onoff]
          @music_2[i].playlist_id = @playlist.id
          @music_2[i].save
        end
        for i in 0..14     
          @audio_name = "audio_name_3_" + i.to_s
          @audio_volume = "audio_volume_3_" + i.to_s
          @audio_onoff = "audio_onoff_3_" + i.to_s
          @music_3[i].name = params[:playlist][@audio_name]
          @music_3[i].volume = params[:playlist][@audio_volume].to_f
          @music_3[i].onoff = params[:playlist][@audio_onoff]
          @music_3[i].playlist_id = @playlist.id
          @music_3[i].save
        end
        redirect_to '/musics/playlist'
    end
    
    def destroy
        @playlist = Playlist.find(params[:id])
        @playlist.destroy
        redirect_to '/musics/playlist'
    end
    
    def playlist_params
      params[:playlist][:user_id] = current_user.id
      params.require(:playlist).permit(:name, :image, :user_id, :writer, :image2)
    end
end

