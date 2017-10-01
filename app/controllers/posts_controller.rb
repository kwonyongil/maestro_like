class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :log_impression, :only=> [:show]

  # GET /posts
  # GET /posts.json
  def index
    @users = User.all
    @posts = Post.search(params)
  end

  #  GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @playlist= Playlist.find(params[:playlist_id])
  end

  # GET /posts/1/edit
  def edit
    @playlist = Playlist.find(@post.playlist_id)
    authorize! :update, @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to '/posts'
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post.update(post_params)
    redirect_to '/posts'
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def share
    @musics = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    @playlist = Playlist.new
    @playlist.user_id = current_user.id
    @playlist_2 = Playlist.find(params[:playlist_id])
    @playlist.writer = @playlist_2.writer
    
    if @playlist_2.image.present?
      @playlist.image = @playlist_2.image
    else
      @playlist.image2 = @playlist_2.image2
    end
    @playlist.name = @playlist_2.name
    @playlist.save
    @playlist_last = Playlist.last
    
    @musics_2 = Music.where(:playlist_id => @playlist_2.id)
    @musics_2.each_with_index do |p,i|
      @musics[i]  =  Music.new
      @musics[i].name = p.name
      @musics[i].volume = p.volume
      @musics[i].onoff = p.onoff
      @musics[i].playlist_id = @playlist_last.id
      @musics[i].save
    end
    
    redirect_to '/musics/playlist'
  end
  
  def log_impression
    @hit_post = Post.find(params[:id])
    # this assumes you have a current_user method in your authentication system
    @hit_post.impressions.create(ip_address: request.remote_ip,user_id:current_user.id)
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :image, :user_id, :playlist_id, :user_name, :name)
    end
end
