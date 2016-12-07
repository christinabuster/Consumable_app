require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  context 'I am on the landing page' do
    Steps 'to get landing page' do
      Given 'I am on landing page' do
        visit '/'
      end # Given
      Then 'I see Welcome to Consumable' do
        expect(page).to have_content ("Welcome to Consumable")
        expect(page).to have_content ("Profile")
        expect(page).to have_content ("Search By")
        expect(page).to have_content ("Log In")
        expect(page).to have_content ("Sign Up")

      end #Then
    end # Steps
  end # Context
end # RSpec
