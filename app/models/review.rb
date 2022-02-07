class Review < ApplicationRecord
  belongs_to :user
  belongs_to :chef, class_name: "User", foreign_key: "chef_id"
end
