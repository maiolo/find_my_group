class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :groups
  validates :group_id, presence: true
end
