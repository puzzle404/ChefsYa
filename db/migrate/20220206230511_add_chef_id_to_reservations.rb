class AddChefIdToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :chef_id, :integer
  end
end
