class ChangeRatingToUsers2 < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :rating, :integer
  end
end
