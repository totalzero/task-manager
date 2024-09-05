class TasksController < ApplicationController
  include Users::LoginHelper
before_action :require_login

def index
@tasks = Task.all
end

def new
@task = Task.new
end

def create
@task = Task.new(task_params)

end

def edit

end

def update

end

def destroy

end
end
