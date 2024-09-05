class Users::DashboardController < ApplicationController
  include Users::LoginHelper
before_action :require_login

  def show

  end

end
