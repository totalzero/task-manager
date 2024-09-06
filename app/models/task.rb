class Task < ApplicationRecord
  belongs_to :group
  belongs_to :assigned_to, class_name: "User", optional: true
  belongs_to :creator, class_name: "User"
end
