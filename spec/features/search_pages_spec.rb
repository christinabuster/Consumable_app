require 'rails_helper'

RSpec.feature "SearchPages", type: :feature do
  context 'Going to website' do
    Steps 'Being welcomed' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can see a welcome message' do
        expect(page). to have_content ("Welcome to Consumable")
      end
    end
#
    Steps 'signup' do
      Given 'I that I am on the sign up page' do
        visit '/'
        click_link('sign_up')
        expect(page).to have_content("Sign up")
      end
      Then 'I can sign up' do
        fill_in('Email', :with => 'test@gmail.com')
        fill_in('user_password', :with => 'password')
        fill_in('user_password_confirmation', :with => 'password')
        click_button('Sign up')
        expect(current_path).to eq('/')
        expect(page).to have_content("Consumable")
        expect(page).to have_content ("@")
        find('#review').click
        expect(page).to have_content ("Listing Reviews")
        find('#new_review').click
        expect(page).to have_content ("New Review")
        fill_in('review_restaurant_name', :with => 'popeyes')
        fill_in('Cuisine', :with => 'Southern')
        fill_in('Dish', :with => 'fried chicken')
        fill_in('Price', :with => '$10')
        select "✭✭✭", :from => "review[rating]"
        fill_in('Street', :with => '1550 Market st.')
        fill_in('City', :with => 'San Diego')
        fill_in('State', :with => 'fried chicken')
        fill_in('Postalcode', :with => '92123')
        fill_in('Description', :with => 'The chicken was very tasty')
        fill_in('User', :with => '1')
        find('#create_review').click
        save_and_open_page
        expect(page).to have_content('The chicken was very tasty')
        # find('#search_by').click
        # expect(page).to have_content('Find It')
        # fill_in('cuisine', :with => 'Southern')
        # find('#find_it').click
        # expect(page).to have_content('Southern')
      end
    end
  end
#
  # context 'Writing a review for a new dish' do
  #   Steps 'input restaurant/dish information' do
  #     Given 'I am on the user review page' do
  #       visit '/reviews/new'
  #     end
  #     Then 'I can fill out the review form' do
  #       fill_in('Restaurant name', :with => 'popeyes')
  #       fill_in('Cuisine', :with => 'Southern')
  #       fill_in('Dish', :with => 'fried chicken')
  #       fill_in('Price', :with => '$10')
  #       select "✭✭✭", :from => "review[rating]"
  #       fill_in('Street', :with => '1550 Market st.')
  #       fill_in('City', :with => 'San Diego')
  #       fill_in('State', :with => 'fried chicken')
  #       fill_in('Postalcode', :with => '92123')
  #       fill_in('Description', :with => 'The chicken was very tasty')
  #       fill_in('User', :with => '1')
  #       find('#create_review').click
  #       expect(page).to have_content('The chicken was very tasty')
  #       find('#search_by').click
  #       expect(page).to have_content('Find It')
  #       fill_in('cuisine', :with => 'Southern')
  #       find('#find_it').click
  #       expect(page).to have_content('Southern')
  #     end
  #   end
  # end
end # RSpec
