#coding: utf-8

class PagesController < ApplicationController
  def home
    @title = "Главная"
    @posts = Post.paginate(:page => params[:page])
  end

  def contact
    @title = "Контакты"
  end

  def about
    @title = "Информация о блоге"
  end
  
  def help
    @title = "Помощь"
  end

end
