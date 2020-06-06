class Answer < ApplicationRecord
  belongs_to :question
  has_many :user_answers
  has_many :profiles, through: :user_answers, dependent: :destroy
  validates :description, presence: true
end
