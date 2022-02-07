class ChangeColumnsOnUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :phone_number, :integer, null: true
    change_column :users, :address, :text, null: true
  end
end
