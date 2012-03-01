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
      flash[:success] = "Сообщение создано!"
      redirect_to root_path
    else
      flash[:error] = "Не удалось создать сообщение!"
    end
  end
  
  def destroy
    @title = "Удаление записи"
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
end
