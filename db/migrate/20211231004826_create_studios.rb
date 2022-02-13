class CreateStudios < ActiveRecord::Migration[6.0]
  def change
    create_table :studios do |t|
      t.text       :introduction,         null: false
      t.string     :postal_code,          null: false
      t.integer    :prefecture_id,        null: false, default: 0
      t.string     :city,                 null: false
      t.string     :address,              null: false
      t.string     :access,               null: false
      t.time       :business_hours_start, null: false
      t.time       :business_hours_end,   null: false
      t.string     :phone_number,         null: false
      t.references :manager,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
