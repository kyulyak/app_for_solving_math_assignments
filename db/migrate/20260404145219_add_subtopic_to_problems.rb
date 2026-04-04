class AddSubtopicToProblems < ActiveRecord::Migration[8.0]
  def change
    add_column :problems, :subtopic, :string
  end
end
