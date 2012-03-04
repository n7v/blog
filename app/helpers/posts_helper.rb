
module PostsHelper
  
  def post_content_cut(content, length=500)
    truncate_html sanitize(content), :length=>length
  end
  
end
