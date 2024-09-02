class Users::DashboardController < ApplicationController
  include Users::LoginHelper
before_action :require_login

  def show

  end

def new_group

end

  def create_group

  end

  private
  def require_login
    unless user_logged?
      flash[:alert] = "you must login"
      redirect_to users_login_path
    end
  end
end
