class AddNameDescriptionSystemColumnsToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :name, :string, default: "Grupo sem nome"
    add_column :groups, :description, :text
    add_column :groups, :game_system, :string
  end
end
