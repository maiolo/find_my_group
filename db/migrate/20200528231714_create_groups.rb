class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.references :master, references: :profile, foreign_key: { to_table: :profiles }

      t.timestamps
    end
  end
end
