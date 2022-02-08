class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_one :photo
  has_many :reviews
  has_many :dishes
  has_one_attached :photo
  validates :photo, presence: true
  scope :chef, -> { where(chef: true) }
end
