#coding: utf-8

class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:new]
  
  def new
    @title = "Регистрация"
  end
  
  def show
    @title = "Информация о пользователе"
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(:page => params[:page])
  end
  
  def index
    @title = "Список пользователей"
    @users = User.paginate(:page => params[:page])
  end

end
