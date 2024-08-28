class Users::RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
if @user.save
flash.now[:notice] = "Registration was succesfull"
render :new
else
  flash.now[:alert] = "registration wrong"
  render :new, status: :unprocessable_entity
end
end


  private
  def user_params
    params.require(:user).permit([:user_name, :email, :password, :password_confirmation])
end
end
