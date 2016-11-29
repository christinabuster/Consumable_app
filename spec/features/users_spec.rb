require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  context 'I am on the landing page' do
    Steps 'to get landing page' do
      Given 'I am on landing page' do
        visit '/'
      end # Given
      Then 'I see Welcome to Consumable' do
        expect(page). to have_content ("Welcome to Consumable")
        click_button 'Sign Up'
        visit '/users/sign_up'
        expect(page).to have_content("Sign up")
        fill_in('Email', :with => 'test@gmail.com')
        fill_in('Password', :with => 'password')
        fill_in('user_password_confirmation', :with => 'password')
      end #Then
    end # Steps
  end # Context
end # RSpec
