module PostsHelper
  def post_wrap(str, col = 80)
    str.gsub(/(.{1,#{col}})( +|$\n?)|(.{1,#{col}})/, "\\1\\3\n")
  end

  def post_content_cut(content, row=2, col=100)
    post_wrap(content).split("\n")[0..(row-1)].join("\n")
  end
end
