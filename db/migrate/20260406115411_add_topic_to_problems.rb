class AddTopicToProblems < ActiveRecord::Migration[8.0]
  def change
    add_reference :problems, :topic, null: false, foreign_key: true
  end
end
