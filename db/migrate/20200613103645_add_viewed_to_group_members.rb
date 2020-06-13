class AddViewedToGroupMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :group_members, :viewed, :boolean, default: false
  end
end
