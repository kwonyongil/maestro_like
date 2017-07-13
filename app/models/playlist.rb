class Playlist < ActiveRecord::Base
    belongs_to :user
    has_many :posts
    has_many :musics
    
    mount_uploader :image, S33Uploader
    serialize :image, JSON
end
