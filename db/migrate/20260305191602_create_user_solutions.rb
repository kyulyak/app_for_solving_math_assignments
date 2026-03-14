class CreateUserSolutions < ActiveRecord::Migration[8.0]
  def change
    create_table :user_solutions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :problem, null: false, foreign_key: true
      t.text :user_answer
      t.boolean :is_correct
      t.datetime :solved_at

      t.timestamps
    end
  end
end
