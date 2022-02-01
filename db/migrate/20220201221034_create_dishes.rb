class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.references :chef_id, references: :users, null: false, foreign_key: true
      t.string :category

      t.timestamps
    end
  end
end
