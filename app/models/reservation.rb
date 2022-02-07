class Reservation < ApplicationRecord
  belongs_to :user
  has_many :selected_dishes
  has_many :dishes, through: :selected_dishes
  attr_accessor :selected_dishes_id
end
