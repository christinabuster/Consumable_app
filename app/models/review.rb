class Review < ActiveRecord::Base
  belongs_to :user
  geocoded_by :street
  after_validation :geocode
  has_attached_file :image, :styles => { :small => "100x100", :medium => "150x150>", :large => "500x500" }
  validates_attachment :image,
  content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
  size: { in: 0..10.megabytes }
  validates :street, :city, :state, :postalcode, :rating, presence: true
  validates :cuisine, :restaurant_name, length: { minimum: 2 }
  validates :price, length: { minimum: 1 }
  validates :description, length: { minimum: 10 }

  def full_address
    street+" "+city+" "+state+" "+postalcode
  end
end
