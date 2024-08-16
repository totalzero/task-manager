class Group < ApplicationRecord
  belongs_to :ovner, class_name: "User"
  has_many :group_memberable
has_many :members, through: :group_memberable, source: :user
has_many :tasks
end
