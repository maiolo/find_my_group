class GroupsController < ApplicationController

  def index
    @groups = policy_scope(Group)
  end
end
