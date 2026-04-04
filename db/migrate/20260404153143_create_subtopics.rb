class CreateSubtopics < ActiveRecord::Migration[8.0]
  def change
    create_table :subtopics do |t|
      t.string :title
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
