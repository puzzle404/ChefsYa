class SelectedDish < ApplicationRecord
  belongs_to :dish
  belongs_to :reservation
end
