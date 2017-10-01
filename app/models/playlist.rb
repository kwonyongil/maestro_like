class Playlist < ActiveRecord::Base
    belongs_to :user
    has_many :posts, dependent: :destroy
    has_many :musics, dependent: :destroy
    
    mount_uploader :image, S33Uploader
    serialize :image, JSON
end
