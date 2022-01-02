class CreateStudioBdays < ActiveRecord::Migration[6.0]
  def change
    create_table :studio_bdays do |t|
      t.references :studio, null: false, foreign_key: true
      t.references :bday,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
