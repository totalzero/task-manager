class GroupsController < ApplicationController
  include Users::LoginHelper
before_action :require_login

def index
  @groups = current_user.groups + current_user.ovned_groups
end

def show
@group = Group.find(params[:id])
end

def new
@group = current_user.ovned_groups.build
end

def create
  @group = current_user.ovned_groups.build(group_params)
  if @group.save
    redirect_to @group
  else
    render :new, status: :unprocessable_entity
  end
end

def edit
@group = Group.find(params[:id])
end

def update
@group = Group.find(params[:id])
if @group.update(group_params)
  redirect_to @group
else
  render :edit, status: :unprocessable_entity
end
end

def destroy
@group = Group.find(params[:id])
@group.destroy
end

def add_member
  @user = User.find_by(email: params[:user_email])
  @group = Group.find(params[:group_id])
  if @user.nil? || @group.nil?
    flash.now[:add_member_alert] = "wrong form parameters"
    render :show, status: :unprocessable_entity
  else
    @group.members.push(@user)
    flash.now[:add_member_notice] = "member was added "
    redirect_to @group
  end

end

private
def group_params
  params.require(:group).permit([:name, :description])
end
end
