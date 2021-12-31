class CreateBdays < ActiveRecord::Migration[6.0]
  def change
    create_table :bdays do |t|
      t.string      :name,  null: false, unique: true
      t.timestamps
    end
  end
end
