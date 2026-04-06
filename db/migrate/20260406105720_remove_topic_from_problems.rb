class RemoveTopicFromProblems < ActiveRecord::Migration[8.0]
  def change
    remove_reference :problems, :topic, null: false, foreign_key: true
  end
end
