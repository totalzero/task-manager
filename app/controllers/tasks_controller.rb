class TasksController < ApplicationController
  include Users::LoginHelper

before_action :require_login

def index
@tasks = Task.all
end

def new
@task = Task.new
@group = Group.find(params[:group_id])
@members = []
@group.members.each do |u|
  @members.push([u.email, u.id])
end
end

def create
@task = Task.new
@group = Group.find(params[:group_id])
@for_user = User.find(task_params[:task_for])
@task.group = @group
@task.assigned_to = @for_user
@task.creator = @group.ovner
@task.title = task_params[:title]
@task.description = task_params[:description]
@task.status = task_params[:status]
if @task.save
redirect_to @group
else
  render :new, status: :unprocessable_entity
end
end

def edit
  @task = Task.new
  @group = Group.find(params[:group_id])
  end

def update
  @task = Task.find(params[:id])
  if @task.update(edit_params)
    redirect_to users_dashboard_path
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
@task = Task.find(params[:id])
@task.destroy
redirect_to users_dashboard_path
end
private
def task_params
  params.require(:task).permit([:title, :description, :status, :task_for])
end
def edit_params
  params.require(:task).permit([:status])
end
end
