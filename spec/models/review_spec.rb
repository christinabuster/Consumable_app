require 'rails_helper'

RSpec.describe Review, type: :model do
  it "has a saved review" do
    review1 = Review.new
    review1.restaurant_name = "Popeyes"
    review1.cuisine = "Southern"
    review1.dish = "Fried Chicken"
    review1.price = "5"
    review1.rating = "3"
    review1.street = "1550 Market Street"
    expect(review1.save).to be true
  end
  # it "Can be searched" do
  # review2 = Review.find(review1.id)
  # expect(review2.restaurant_name).to be "Popeyes"
  # expect(review2.cuisine).to be "Southern"
  # expect(review2.dish).to be "Fried Chicken"
  # expect(review2.price).to eq "5"
  # expect(review2.rating).to eq "3"
  # expect(review2.street).to eq "1550 Market Street"
# end
end
