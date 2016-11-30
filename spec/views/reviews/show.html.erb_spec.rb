require 'rails_helper'

RSpec.describe "reviews/show", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :latitude => 2.5,
      :longitude => 3.5,
      :restaurant_name => "Restaurant Name",
      :cuisine => "Cuisine",
      :dish => "Dish",
      :price => 4.5,
      :rating => 5,
      :street => "Street",
      :city => "City",
      :state => "State",
      :postalcode => "Postalcode",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Restaurant Name/)
    expect(rendered).to match(/Cuisine/)
    expect(rendered).to match(/Dish/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Postalcode/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
