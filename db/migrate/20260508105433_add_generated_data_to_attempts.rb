class AddGeneratedDataToAttempts < ActiveRecord::Migration[8.0]
  def change
    add_column :attempts, :problem_content, :text
    add_column :attempts, :correct_answer, :text
    add_column :attempts, :solution, :text
  end
end
