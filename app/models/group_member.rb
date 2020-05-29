class GroupMember < ApplicationRecord
  belongs_to :group, dependent: :destroy
  belongs_to :profile
end
