class Post < ActiveRecord::Base
  attr_accessible :content, :title
  
  belongs_to :user
  has_many :comments
  has_many :tags, :through => :tagrelations, :source => :tag
  has_many :tagrelations, :dependent => :destroy

  default_scope :order => 'posts.created_at DESC'
  
  def add_tag(tagname)
    tag = Tag.find_or_create_by_name(tagname)
    if tag != nil
      rel = Tagrelation.find_by_post_id_and_tag_id(self.id, tag[:id])
      if rel.nil?
        self.tagrelations.create(:tag_id => tag[:id])
      end
    end
  end
  
  def add_tags(tagnames)
    tagnames.split(' ').each do |tag|
      if not tag.blank? then add_tag(tag) end
    end
  end
  
end
