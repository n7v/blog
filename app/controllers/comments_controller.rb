class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create]
  
  def new
    @user = current_user
    if @user.nil? then
      @comment = Comment.new
    else
      @comment = @user.comments.new
    end
  end
  
  def create
    @post = Post.find_by_id(params["post"]["id"])
    if @post.nil?
      flash[:error] = "Не удалось создать комментарий."
      redirect_to root_path
      return
    end
    @content = params["comment"]["content"]
    @user = current_user
    if @user.nil?
      @comment = Comment.new(:post_id => @post[:id], :content => @content)
    else
      @comment = @user.comments.new(:post_id => @post[:id], :content => @content)
    end
    if not @comment.save
      flash[:error] = "Не удалось создать комментарий."
    end
    redirect_to post_path(@post) + "#comments"
  end
  
end
