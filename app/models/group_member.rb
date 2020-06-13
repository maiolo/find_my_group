class GroupMember < ApplicationRecord
  belongs_to :group
  belongs_to :profile

  validates :profile, uniqueness: {scope: :group}

  def been_viewed
    self.update(viewed: true)
  end
end
