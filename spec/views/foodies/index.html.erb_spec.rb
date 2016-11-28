require 'rails_helper'

RSpec.describe "foodies/index", type: :view do
  before(:each) do
    assign(:foodies, [
      Foodie.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :user_name => "User Name",
        :password => ""
      ),
      Foodie.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :user_name => "User Name",
        :password => ""
      )
    ])
  end

  it "renders a list of foodies" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
