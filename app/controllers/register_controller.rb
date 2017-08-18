class RegisterController < ApplicationController
  before_action :set_user, only: [:info1, :info2, :infoget]
  before_filter :authenticate_user!
  def info1
  end

  def info2
  end
  
  def infoget
    # 이메일 있음
    unless @user.email.nil? or @user.email == ''
   
    # 이메일 없음 = kakao
    else
      @user.email = params[:email]
   
    end
    @user.save
    redirect_to musics_playlist_path
  end

  private
  def set_user
    @user = current_user
  end
end
