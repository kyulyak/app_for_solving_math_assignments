class AddIsPublishedToProblems < ActiveRecord::Migration[8.0]
  def change
    add_column :problems, :is_published, :boolean, default: true
  end
end
