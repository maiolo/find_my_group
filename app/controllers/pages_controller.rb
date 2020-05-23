class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def questions
    questions = Questions.all
    answered_questions = []
    user_answers = current_user.profile.user_answers
    if user_answers.lenght.zero?
      @question = questions.shuffle.first
    else
      current_user.profile.user_answers.each do |ua|
        answered_questions << ua.answer.question
      end
      @question = questions.difference(answered_questions).shuffle.first
    end
  end
end
