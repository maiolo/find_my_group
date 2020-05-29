class UserInteraction < ApplicationRecord
  belongs_to :current_user, dependent: :destroy
  belongs_to :another_user, dependent: :destroy

  validates :liked, presence: true
end
