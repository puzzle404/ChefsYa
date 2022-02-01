class Dish < ApplicationRecord
  belongs_to :chef, class_name: 'User'
end
