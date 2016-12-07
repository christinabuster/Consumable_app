class Review < ActiveRecord::Base
  belongs_to :user
  geocoded_by :street
  after_validation :geocode
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :image,
  content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
  size: { in: 0..10.megabytes }
  validates :street, :city, :state, :postalcode, presence: true
  validates :cuisine, :restaurant_name, length: { minimum: 2 }
  validates :price, length: { minimum: 1 }
  validates :description, length: { minimum: 10 }
end
