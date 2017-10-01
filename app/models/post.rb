class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :playlist
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user, dependent: :destroy
    
    after_destroy :log_destroy_action
    
    paginates_per 20
    
    
    has_many :impressions, :as=>:impressionable
 
    def impression_count
        impressions.size
    end
     
    def unique_impression_count
        # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
        # so getting keys from the hash and calculating the number of keys
        impressions.group(:ip_address).size.keys.length #TESTED
    end


    def self.search(params)
         posts = Post.order('created_at DESC').page(params[:page])  
         posts = Post.where(["content LIKE ? OR title LIKE ? OR user_id LIKE ? ","%#{params[:search]}%", "%#{params[:search]}%"  ,"%#{params[:search]}%"]).order('created_at DESC').page(params[:page])  

    end
   
 
  def log_destroy_action
    puts 'Post destroyed'
  end





end
