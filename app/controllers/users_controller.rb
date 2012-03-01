#coding: utf-8

class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:new]
  
  def new
    @title = "Регистрация"
  end

end
