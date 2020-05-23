class Answer < ApplicationRecord
  belongs_to :question
  has_many :user_answer

  validates :description, presence: true
end
