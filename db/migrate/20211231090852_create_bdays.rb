class CreateBdays < ActiveRecord::Migration[6.0]
  def change
    create_table :bdays do |t|
      t.string      :bday,  null: false, unique: true
      t.timestamps
    end
  end
end
