require 'rails_helper'

RSpec.describe Review, type: :model do
  it "has a saved review" do
    review1 = Review.new
    review1.restaurant_name = "Popeyes"
    review1.cuisine = "Southern"
    review1.dish = "Fried Chicken"
    review1.price = 5.0
    review1.rating = 3
    review1.street = "1550 Market Street"
    review1.city = "San Diego"
    review1.state = "California"
    review1.postalcode = "92116"
    review1.description = "It was wonderful"
    expect(review1.save).to be true
  end
end
