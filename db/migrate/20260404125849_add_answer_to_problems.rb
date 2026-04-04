class AddAnswerToProblems < ActiveRecord::Migration[8.0]
  def change
    add_column :problems, :correct_answer, :string
    add_column :problems, :problem_type, :string
  end
end
