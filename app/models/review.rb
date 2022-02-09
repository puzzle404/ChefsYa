class Review < ApplicationRecord
  belongs_to :user
  belongs_to :chef, class_name: "User", foreign_key: "chef_id"
  validates :comment, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
