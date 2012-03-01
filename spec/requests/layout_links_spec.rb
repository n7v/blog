#coding: utf-8

require 'spec_helper'

describe "LayoutLinks" do
  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Главная")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Контакты")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "Информация о блоге")
  end

  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Помощь")
  end
end
