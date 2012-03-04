class TagsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def show
    @tag = Tag.find_by_id(params[:id])
    @title = "Тег - #{@tag.name}"
    @posts = @tag.posts.paginate(:page => params[:page])
  end
  
  def index
    @title = "Все теги"
    @tags = Tag.paginate(:page => params[:page])
  end
end