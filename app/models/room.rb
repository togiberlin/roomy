class Room < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :reviews

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates_presence_of :home_type, :room_type, :accommodate, :bed_room,
                        :bath_room, :listing_name, :summary, :address
  validates_length_of :listing_name, maximum: 50
  validates_length_of :summary, maximum: 500
  validates_length_of :address, maximum: 100
  validates_numericality_of :latitude, :longitude

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end
end
