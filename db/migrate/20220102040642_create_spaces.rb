class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.text       :info,            null: false
      t.string     :space_name,      null: false
      t.string     :space_name_kana, null: false
      t.float      :length,          null: false
      t.float      :width,           null: false
      t.float      :size,            null: false
      t.float      :height,          null: false
      t.integer    :fee_morning,     null: false
      t.integer    :fee_day,         null: false
      t.integer    :fee_night,       null: false
      t.references :studio,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
