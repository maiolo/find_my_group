class Group < ApplicationRecord
  belongs_to :master
  has_many :group_members
end
