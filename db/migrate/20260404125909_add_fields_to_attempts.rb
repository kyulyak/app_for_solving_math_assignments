class AddFieldsToAttempts < ActiveRecord::Migration[8.0]
  def change
    add_column :attempts, :time_spent, :integer
    add_column :attempts, :shown_solution, :boolean
  end
end
