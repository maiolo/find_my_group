class UserAnswer < ApplicationRecord
  belongs_to :answer, dependent: :destroy
  belongs_to :profile, dependent: :destroy
end
