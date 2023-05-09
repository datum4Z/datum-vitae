class CreateExperienceDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :experience_details do |t|
      t.text :description
      t.references :experience, null: false, foreign_key: true

      t.timestamps
    end
  end
end
