class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  paginates_per 3
end
