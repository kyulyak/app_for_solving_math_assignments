class CreateNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :notes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reference_material, null: false, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
