class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :post_id
  
  belongs_to :user
  belongs_to :post
  
  default_scope :order => 'comments.created_at DESC'
end
