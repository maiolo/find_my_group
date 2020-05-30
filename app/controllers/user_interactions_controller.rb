class UserInteractionsController < ApplicationController
  include GroupManagement

  def create
    @user_interaction = UserInteraction.new(user_interaction_params)
    @user_interaction.action_user = current_user.profile
    authorize @user_interaction
    @user_interaction.save
    maybe_add_to_group(@user_interaction)
    redirect_to request.referrer
  end

  private

  def user_interaction_params
    params.require(:user_interaction).permit(:liked, :target_user_id)
  end

end
