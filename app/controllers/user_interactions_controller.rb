class UserInteractionsController < ApplicationController

  def create
    @user_interaction = UserInteraction.new(user_interaction_params)
    @user_interaction.current_user = current_user.profile
    @user_interaction.save
    unless its_a_match?(@user_interaction.current_user, @user_interaction.another_user)
      redirect_to :back
    else 
      groups_p1 = GroupMember.where(profile: @user_interaction.current_user)
      groups_p2 = GroupMember.where(profile: @user_interaction.another_user)
      if groups_p1.length.zero? && groups_p2.length.zero?
        group_creation(@user_interaction.current_user, @user_interaction.another_user)
      elsif groups_p1.length > groups_p2.length
        unless group_association(@user_interaction.current_user, @user_interaction.another_user)
          unless group_association(@user_interaction.another_user, @user_interaction.current_user)
            group_creation(@user_interaction.current_user, @user_interaction.another_user)
          end
        end
      else
        unless group_association(@user_interaction.another_user, @user_interaction.current_user)
          unless group_association(@user_interaction.current_user, @user_interaction.another_user)
            group_creation(@user_interaction.current_user, @user_interaction.another_user)
          end
        end
      end
      # match_counter = 1
      # groups_p1.each do |group|
      #   group.group.group_members.each do |member|
      #     next if member.profile = current_user.profile
      #     if its_a_match?(member.profile, @user_interaction.another_user)
      #       match_counter += 1
      #     end
      #   end
      #   if match_counter > (group.group_members.count / 2)
      #     GroupMember.create(profile: @user_interaction.another_user, group: group)
      #   end
      #   match_counter = 1
      # end
  end

  private

  def group_creation(profile1, profile2)
    if profile1.favorite_role == "Narrador"
      group = Group.create(master: profile1)
      GroupMember.create(profile: profile1, group: group)
      GroupMember.create(profile: profile2, group: group)
    elsif profile2.favorite_role == "Narrador"
      group = Group.create(master: profile2)
      GroupMember.create(profile: profile1, group: group)
      GroupMember.create(profile: profile2, group: group)
    else
      group = Group.create
      GroupMember.create(profile: profile1, group: group)
      GroupMember.create(profile: profile2, group: group)
    end
  end

  def group_association(profile1, profile2)
    groups = GroupMember.where(profile: profile1)
    match_counter = 1
    associated = nil
    groups.each do |g|
      g.group.group_members.each do |member|
        next if member.profile = current_user.profile
        if its_a_match?(member.profile, profile2)
          match_counter += 1
        end
      end
      if match_counter > (g.group.group_members.count / 2)
        associated = GroupMember.create(profile: profile2, group: g.group)
        if g.group.master.nil?
          g.group.master = profile2
        end
      elsif g.group.master.nil?
        g.group.master = profile2
      end
      match_counter = 1
    end
    associated.nil?
  end

  def its_a_match?(profile1, profile2)
    interactions = UserInteraction.where("current_user in (?, ?) AND another_user in (?, ?) AND liked = true", profile1, profile2, profile1, profile2)
    interactions.length == 2
  end


  def user_interaction_params
    params.require(:user_interaction).permit(:liked, :another_user)
  end
end
