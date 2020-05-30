class GroupsController < ApplicationController

  def index
    @groups = policy_scope(Group)
  end

  def show
    set_group
  end
end


private

  def set_group
    @group = Group.find(params[:id])
    authorize @group
  end
