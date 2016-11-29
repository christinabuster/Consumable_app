require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  context 'I am on the landing page' do
    Steps 'to get landing page' do
      Given 'I am on landing page' do
        visit '/'
      end # Given
      Then 'I see Welcome to Consumable' do
        expect(page). to have_content ("Welcome to Consumable")
        expect(page). to have_content ("Restaurants")
        expect(page). to have_content ("Foodies' Profiles")
        expect(page). to have_content ("Wishlist")
        expect(page). to have_content ("Search By")
        expect(page). to have_content ("Sign In")
        expect(page). to have_content ("Sign Up")
        expect(page). to have_content ("Concerns?")
        expect(page). to have_content ("Address")
        expect(page). to have_content ("Phone")
        expect(page). to have_content ("Email")
        expect(page). to have_content ("Send Message")
      end #Then
    end # Steps
  end # Context
end # RSpec
