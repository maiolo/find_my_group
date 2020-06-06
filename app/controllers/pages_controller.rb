class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def questions
    @user_answer = UserAnswer.new
    questions = Question.all
    answered_questions = []
    user_answers = current_user.profile.user_answers

    if user_answers.length.zero?
      @question = questions.shuffle.first
      @answers = @question.answers
    else
      user_answers.each do |ua|
        answered_questions << ua.answer.question
      end
      @question = (questions - answered_questions).shuffle.first
      unless @question.nil?
        @answers = @question.answers
      end
    end
  end

  def liked_by
    @profiles = UserInteraction.all.where("target_user_id = ? and liked = true", current_user.profile).map{ |ue| ue.action_user }
  end
end

