module TasksHelper
def task_creator?(user, task)
    return user == task.creator
end
end
