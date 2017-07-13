class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :likes
  has_many :comments   
  has_many :liked_posts, through: :likes, source: :post
  has_many :playlists
  has_many :posts
  
  def is_like?(post)
     Like.find_by(user_id: self.id, post_id: post.id).present?
  end
end
