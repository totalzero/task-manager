class User < ApplicationRecord
  has_secure_password

has_many :group_memberable
has_many :groups, through: :group_memberable
has_many :ovned_groups, class_name: "Group", foreign_key: "ovner_id"
has_many :assigned_tasks, class_name: "Task", foreign_key: "assigned_to_id"
end
