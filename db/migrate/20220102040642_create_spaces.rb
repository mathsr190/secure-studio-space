class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.text       :info,            null: false
      t.string     :space_name,      null: false
      t.string     :space_name_kana, null: false
      t.decimal    :length,          null: false, precision: 4, scale: 2
      t.decimal    :width,           null: false, precision: 4, scale: 2
      t.decimal    :size,            null: false, precision: 4, scale: 2
      t.decimal    :height,          null: false, precision: 4, scale: 2
      t.integer    :fee_morning,     null: false
      t.integer    :fee_day,         null: false
      t.integer    :fee_night,       null: false
      t.references :studio,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
