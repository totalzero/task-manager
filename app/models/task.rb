class Task < ApplicationRecord
  belongs_to :group
  belongs_to :assigned_to, class_name: "user", optional: true
  belongs_to :creator, class_name: "user"
end
