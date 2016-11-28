require 'rails_helper'

RSpec.describe "foodies/show", type: :view do
  before(:each) do
    @foodie = assign(:foodie, Foodie.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :user_name => "User Name",
      :password => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/User Name/)
    expect(rendered).to match(//)
  end
end
