#coding: utf-8

class PostsController < ApplicationController

  
  
  def posts
    @title = "Все записи"
    @posts = Post.paginate(:page => params[:page])
  end
  
  def new
    
  end
  
  def destroy
    
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
end
