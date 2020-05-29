class CreateUserInteractions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_interactions do |t|
      t.references :current_user, references: :profile, null: false, foreign_key: { to_table: :profiles }
      t.boolean :liked, null: false
      t.references :another_user, references: :profile, null: false, foreign_key: { to_table: :profiles }

      t.timestamps
    end
  end
end
