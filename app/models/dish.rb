class Dish < ApplicationRecord
  belongs_to :chef, class_name: 'User', foreign_key: "chef_id"
  has_many :reservations, through: :selected_dishes
end
