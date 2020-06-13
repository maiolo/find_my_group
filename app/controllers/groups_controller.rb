class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update]

  def index
    @groups = policy_scope(Group)
    @user_groups = current_user.profile.groups
    @new_groups = current_user.profile.group_members.where(viewed: false).map { |gm| gm.group }
  end

  def edit
    @group_members =  @group.group_members.map{ |member| member.profile}
    #@group_members = @group.group_members
  end

  def update
    @group.update(group_params)
    redirect_to groups_path
  end

  def show
    set_group
  end
end


private

  def group_params
    params.require(:group).permit(:master_id, :name, :description, :game_system, :photo)
  end

  def set_group
    @group = Group.find(params[:id])
    authorize @group
  end
