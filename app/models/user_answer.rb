class UserAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :profile, dependent: :destroy
end
