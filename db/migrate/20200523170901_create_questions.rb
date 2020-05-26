class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :description, null:false
      t.integer :score, null: false, default: 0 
      t.boolean :key_question, null: false, default: false

      t.timestamps
    end
  end
end
