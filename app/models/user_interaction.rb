class UserInteraction < ApplicationRecord
  belongs_to :current_user, class_name: :Profile
  belongs_to :another_user, class_name: :Profile

end
