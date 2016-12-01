class Review < ActiveRecord::Base
  belongs_to :user
  geocoded_by :street
  after_validation :geocode
  validates :street, :city, :state, :postalcode, presence: true
  validates :rating, length: { in: 1..5 }
  validates :cuisine, :restaurant_name, length: { minimum: 2 }
  validates :price, length: { minimum: 1 }
  validates :description, length: { minimum: 10 }
end
