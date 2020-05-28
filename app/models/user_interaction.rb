class UserInteraction < ApplicationRecord
  belongs_to :current_user
  belongs_to :another_user
end
