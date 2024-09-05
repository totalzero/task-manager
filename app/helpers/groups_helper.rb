module GroupsHelper
  def owner?(user, group)
    return group.ovner == user
  end
end
