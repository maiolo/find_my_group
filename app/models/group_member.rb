class GroupMember < ApplicationRecord
  belongs_to :group
  belongs_to :profile

  validates :profile, uniqueness: {scope: :group}
end
