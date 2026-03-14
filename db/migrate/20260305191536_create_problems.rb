class CreateProblems < ActiveRecord::Migration[8.0]
  def change
    create_table :problems do |t|
      t.string :title
      t.text :content
      t.text :solution
      t.integer :difficulty
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
