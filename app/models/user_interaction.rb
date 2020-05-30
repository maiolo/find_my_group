class UserInteraction < ApplicationRecord
  belongs_to :action_user, class_name: :Profile
  belongs_to :target_user, class_name: :Profile
  
  validates :action_user, uniqueness: { scope: :target_user }

end
