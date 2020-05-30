class AddIndexToUserInteractions < ActiveRecord::Migration[6.0]
  def change
    add_index :user_interactions, [:action_user_id, :target_user_id], unique: true
  end
end
