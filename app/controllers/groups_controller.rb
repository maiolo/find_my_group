class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update]

  def index
    @groups = policy_scope(Group)
    @user_groups = current_user.profile.groups
  end

  def edit
  end

  def update
    @group.update(group_params)
    @group.save
    redirect_to groups_path
  end

  def show
    set_group
  end
end


private

  def group_params
    params.require(:group).require(:master)
  end

  def set_group
    @group = Group.find(params[:id])
    authorize @group
  end
