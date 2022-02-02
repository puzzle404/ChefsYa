class Reservation < ApplicationRecord
  belongs_to :user
  has_many :dishes, through: :selected_dishes
end
