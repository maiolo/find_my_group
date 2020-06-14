class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :group
  validates :group, presence: true
end
