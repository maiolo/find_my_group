class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.references :master, references: :profile, null: false, foreign_key: { to_table: :profiles }

      t.timestamps
    end
  end
end
