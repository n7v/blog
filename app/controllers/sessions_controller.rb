class SessionsController < Devise::SessionsController

  before_filter :authenticate_user!, :except => [:new]
  
  def new
    super
  end
  
  def destroy
    super
    reset_session
  end

end
