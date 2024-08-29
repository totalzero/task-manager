class Users::LoginController < ApplicationController
include Users::LoginHelper

  def new
    @user = User.new
  end

  def create
@user = User.find_by(email: user_params[:email])
if @user&.authenticate(user_params[:password])
  login_user(@user)
  render :new
else
  flash.now[:alert] = "wrong login parameters"
  render :new, status: :not_found
end
  end

  def destroy
    logout_user
    flash.now[:notice] = "user logout"
    redirect_to users_login_path
  end

private
  def user_params
params.require(:user).permit([:email, :password])
  end
end
