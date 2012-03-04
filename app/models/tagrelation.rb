class Tagrelation < ActiveRecord::Base
  attr_accessible :tag_id, :post_id
  
  belongs_to :tag
  belongs_to :post
end
