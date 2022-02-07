class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :chef, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
