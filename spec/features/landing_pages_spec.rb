require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  context 'I am on the landing page' do
    Steps 'to get landing page' do
      Given 'I am on landing page' do
        visit '/'
      end # Given
      Then 'I see Welcome to Consumable' do
        expect(page). to have_content ("Welcome to Consumable") 
      end #Then
    end # Steps
  end # Context
end # RSpec
