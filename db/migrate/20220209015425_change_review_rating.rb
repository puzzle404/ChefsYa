class ChangeReviewRating < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :rating, :float, default: 0
  end
end
