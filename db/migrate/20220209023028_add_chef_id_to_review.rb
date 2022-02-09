class AddChefIdToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :chef_id, :integer
  end
end
