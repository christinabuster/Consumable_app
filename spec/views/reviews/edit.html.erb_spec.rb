require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :latitude => 1.5,
      :longitude => 1.5,
      :restaurant_name => "MyString",
      :cuisine => "MyString",
      :dish => "MyString",
      :price => 1.5,
      :rating => 1,
      :street => "MyString",
      :city => "MyString",
      :state => "MyString",
      :postalcode => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input#review_latitude[name=?]", "review[latitude]"

      assert_select "input#review_longitude[name=?]", "review[longitude]"

      assert_select "input#review_restaurant_name[name=?]", "review[restaurant_name]"

      assert_select "input#review_cuisine[name=?]", "review[cuisine]"

      assert_select "input#review_dish[name=?]", "review[dish]"

      assert_select "input#review_price[name=?]", "review[price]"

      assert_select "input#review_rating[name=?]", "review[rating]"

      assert_select "input#review_street[name=?]", "review[street]"

      assert_select "input#review_city[name=?]", "review[city]"

      assert_select "input#review_state[name=?]", "review[state]"

      assert_select "input#review_postalcode[name=?]", "review[postalcode]"

      assert_select "textarea#review_description[name=?]", "review[description]"

      assert_select "input#review_user_id[name=?]", "review[user_id]"
    end
  end
end
