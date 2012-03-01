class SessionsController < Devise::SessionsController

  before_filter :authenticate_user!, :except => [:new, :create]
  
  def create
  end
  
  def new
  end
  
  def destroy
    super
    reset_session
  end

end
