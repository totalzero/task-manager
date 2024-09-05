class ApplicationController < ActionController::Base
  protected
  def require_login
    unless user_logged?
      flash[:alert] = "you must logged in to show your dashboard "
      redirect_to users_login_path
    end
  end

end
