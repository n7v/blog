#coding: utf-8

class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def index
    @title = "Все записи"
    @posts = Post.paginate(:page => params[:page])
  end
  
  def new
    @title = "Добавление записи"
    @user = current_user
    @post = Post.new
  end
  
  def create
    @post  = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Запись создана!"
      redirect_to root_path
    else
      flash[:error] = "Не удалось создать запись!"
    end
  end
  
  def destroy
    @title = "Удаление записи"
  end
  
  def show
    @post = Post.find(params[:id])
    @title = @post.title
    if current_user.nil?
      @new_comment = @post.comments.new
    else
      @new_comment = current_user.comments.new(:post_id => @post[:id])
    end
  end
  
end
