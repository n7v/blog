#coding: utf-8

module ApplicationHelper
 
  def title
    base_title = "Блог"
    page_title = content_for(:title) 
    if page_title.nil?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  #Devise
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
