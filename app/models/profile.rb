class Profile < ActiveRecord::Base
  belongs_to :user
  validates :name, uniqueness: true, length: { minimum: 2 }
end
