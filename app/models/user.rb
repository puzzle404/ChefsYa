class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :set_rating
  before_save :set_phone

  # has_one :photo
  has_many :reviews
  has_many :dishes
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :photo, presence: true

  scope :chef, -> { where(chef: true) }
  def set_rating
    self.rating = 0
  end

  def set_phone
    self.phone_number = 0
  end
end
