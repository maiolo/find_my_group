module GroupManagement

  def maybe_add_to_group(user_interaction)
    if its_a_match?(user_interaction.action_user, user_interaction.target_user)
      add_to_group(user_interaction)
      give_alert
    end
  end

  private

  def add_to_group(user_interaction)
    groups_p1 = GroupMember.where(profile: user_interaction.action_user)
    groups_p2 = GroupMember.where(profile: user_interaction.target_user)
      if groups_p1.length.zero? && groups_p2.length.zero?
        group_creation(user_interaction.action_user, user_interaction.target_user)
      elsif groups_p1.length > groups_p2.length
        if group_association(user_interaction.action_user, user_interaction.target_user)
          if group_association(user_interaction.target_user, user_interaction.action_user)
            group_creation(user_interaction.action_user, user_interaction.target_user)
          end
        end
      else
        if group_association(user_interaction.target_user, user_interaction.action_user)
          if group_association(user_interaction.action_user, user_interaction.target_user)
            group_creation(user_interaction.action_user, user_interaction.target_user)
          end
        end
      end
  end

  def group_creation(profile1, profile2)
    if profile1.favorite_role == "Narrador"
      group = Group.create(master: profile1)
    elsif profile2.favorite_role == "Narrador"
      group = Group.create(master: profile2)
    else
      group = Group.create
    end
    GroupMember.create(profile: profile1, group: group)
    GroupMember.create(profile: profile2, group: group)

    chatroom = Chatroom.create(name: group.name, group: group)
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
      if match_counter >= (g.group.group_members.count / 2)
        associated = GroupMember.create(profile: profile2, group: g.group)
        if g.group.master.nil? && profile2.favorite_role == "Narrador"
          g.group.master = profile2
          g.group.save
        end
      elsif g.group.master.nil? && profile2.favorite_role == "Narrador"
        g.group.master = profile2
        g.group.save
        associated = GroupMember.create(profile: profile2, group: g.group)
      end
      match_counter = 1
    end
    associated.nil?
  end

  def its_a_match?(profile1, profile2)
    interactions = UserInteraction.where("action_user_id IN (?, ?) AND target_user_id IN (?, ?) AND liked = true", profile1.id, profile2.id, profile1.id, profile2.id)
    interactions.length == 2
  end

  def give_alert
    sweetalert_success('', 'Você está um novo Grupo', persistent: 'OK!')
  end

end
