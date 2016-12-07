class Profile < ActiveRecord::Base
  belongs_to :user
  validates :name, :birthday, uniqueness: true
  validates :email, { case_sensitive: false }
end
