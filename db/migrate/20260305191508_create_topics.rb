class CreateTopics < ActiveRecord::Migration[8.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :icon

      t.timestamps
    end
  end
end
