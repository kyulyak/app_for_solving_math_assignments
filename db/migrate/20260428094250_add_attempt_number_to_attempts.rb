class AddAttemptNumberToAttempts < ActiveRecord::Migration[8.0]
  def change
    add_column :attempts, :attempt_number, :integer
  end
end
