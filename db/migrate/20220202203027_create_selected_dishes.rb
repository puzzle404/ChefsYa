class CreateSelectedDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :selected_dishes do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
