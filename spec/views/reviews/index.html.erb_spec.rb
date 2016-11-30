require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
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
      ),
      Review.create!(
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
      )
    ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "Restaurant Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cuisine".to_s, :count => 2
    assert_select "tr>td", :text => "Dish".to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Postalcode".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
