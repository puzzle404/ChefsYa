class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.references :chef, references: :users, null: false, foreign_key: {to_table: :users}
      t.string :category

      t.timestamps
    end
  end
end
