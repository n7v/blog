class Post < ActiveRecord::Base
  attr_accessible :content, :title
  
  belongs_to :user
  has_many :comments

  default_scope :order => 'posts.created_at DESC'
end
