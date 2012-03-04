#coding: utf-8

class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :index, :show]
  
  def new
    @title = "Регистрация"
  end
  
  def show
    @title = "Информация о пользователе"
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(:page => params[:page])
  end
  
  def index
    @title = "Все пользователи"
    @users = User.paginate(:page => params[:page])
  end

end
