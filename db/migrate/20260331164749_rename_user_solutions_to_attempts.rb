class RenameUserSolutionsToAttempts < ActiveRecord::Migration[8.0]
  def change
    rename_table :user_solutions, :attempts
  end
end
