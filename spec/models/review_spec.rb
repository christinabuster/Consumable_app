require 'rails_helper'

RSpec.describe Review, type: :model do
  it "has a lot of stuff" do
    review1 = Review.new
    review1.restaurant_name = "Popeyes"
    review1.cuisine = "Southern"
    review1.dish = "Fried chicken"
    review1.price = "5"
    review1.rating = "3"
    review1.street = ""
    expect(car1.save).to be true
    car2 = Car.find(car1.id)
    expect(car2.year).to be 1999
    expect(car2.make).to eq "Tata"
    expect(car2.license_plate).to eq "ABC123"
  end
end
