class ChangeRatingToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :rating, :float
  end
end
