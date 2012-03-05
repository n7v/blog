#coding: utf-8

class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(:page => params[:page])
  end
  
  def index
    @users = User.paginate(:page => params[:page])
  end

end
