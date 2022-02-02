class ChangeColumnOnUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :rating, :integer, null: true
    change_column :users, :bio, :text, null: true
  end
end
