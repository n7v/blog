class Tag < ActiveRecord::Base
  attr_accessible :tag_id, :name
  
  has_many :posts, :through => :tagrelations, :source => :post
  has_many :tagrelations, :dependent => :destroy
end
