class Answer < ApplicationRecord
  belongs_to :question
  has_many :user_answers, dependent: :destroy
  has_many :profiles, through: :user_answers
  validates :description, presence: true
end
