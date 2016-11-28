require 'rails_helper'

RSpec.describe "foodies/edit", type: :view do
  before(:each) do
    @foodie = assign(:foodie, Foodie.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :user_name => "MyString",
      :password => ""
    ))
  end

  it "renders the edit foodie form" do
    render

    assert_select "form[action=?][method=?]", foodie_path(@foodie), "post" do

      assert_select "input#foodie_first_name[name=?]", "foodie[first_name]"

      assert_select "input#foodie_last_name[name=?]", "foodie[last_name]"

      assert_select "input#foodie_email[name=?]", "foodie[email]"

      assert_select "input#foodie_user_name[name=?]", "foodie[user_name]"

      assert_select "input#foodie_password[name=?]", "foodie[password]"
    end
  end
end
