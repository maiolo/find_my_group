class Group < ApplicationRecord
  belongs_to :master, class_name: :Profile, optional: true
  has_many :group_members, dependent: :destroy
end