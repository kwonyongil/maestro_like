class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :playlist
    has_many :likes
    has_many :comments
    has_many :liked_users, through: :likes, source: :user
    
        paginates_per 20
    
    def self.search(params)
  posts = Post.order('created_at DESC').page(params[:page])  
  posts = Post.where(["content LIKE ? OR title LIKE ? OR user_id LIKE ? ","%#{params[:search]}%", "%#{params[:search]}%"  ,"%#{params[:search]}%"]).order('created_at DESC').page(params[:page])  

end





end
