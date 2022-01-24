class CreateReservationDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :reservation_details do |t|
      t.datetime    :time_start,  null: false
      t.datetime    :time_end,    null: false
      t.integer     :price,       null: false
      t.references  :reservation, null: false, foreign_key: true
      t.timestamps
    end
  end
end
