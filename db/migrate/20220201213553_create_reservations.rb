class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.text :observations
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
