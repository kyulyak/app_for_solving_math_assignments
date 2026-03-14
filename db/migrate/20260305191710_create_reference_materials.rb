class CreateReferenceMaterials < ActiveRecord::Migration[8.0]
  def change
    create_table :reference_materials do |t|
      t.string :title
      t.text :content
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
