require 'rails_helper'

RSpec.feature "SearchPages", type: :feature do
  context 'Going to website' do
    Steps 'Being welcomed' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can see a welcome message' do
        expect(page).to have_content ("Welcome to Consumable")
      end
    end

    Steps 'to signup' do
      Given 'that I am on the landing page' do
        visit '/'
        click_link('sign_up')
        expect(page).to have_content("Sign up")
      end
      Then 'I can sign up, create a profile automatically and view it' do
        fill_in('Email', :with => 'test@gmail.com')
        fill_in('user_password', :with => 'password')
        fill_in('user_password_confirmation', :with => 'password')
        click_button('Sign up')
        expect(page).to have_content("New Profile")
        expect(page).to have_content ("@")
        expect(page).to have_content ("About me")
        fill_in('Name', :with => 'Test')
        select "2011", :from => "profile_birthday_1i"
        select "November", :from => "profile_birthday_2i"
        select "30", :from => "profile_birthday_3i"
        fill_in('About me', :with => 'Im am older than 5')
        click_button('Update Profile')
        expect(page).to have_content("Profile was successfully updated.")
        expect(page).to have_content("2011")
        expect(page).to have_content("Im am older than 5")
        click_link('Logout')
        click_link('Log In')
        fill_in('user_email', :with => 'test@gmail.com')
        fill_in('user_password', :with => 'password')
        click_button('Log in')
        expect(page).to have_content('2011')
      end
      Then 'i can add review' do
        find('#review').click
        find('#new_review').click
        fill_in('Restaurant name', :with => 'popeyes')
        fill_in('Cuisine', :with => 'Southern')
        fill_in('Dish', :with => 'fried chicken')
        fill_in('Price', :with => '10')
        select "✭✭✭", :from => "review[rating]"
        fill_in('Street', :with => '1550 Market st.')
        fill_in('City', :with => 'San Diego')
        fill_in('State', :with => 'fried chicken')
        fill_in('Postalcode', :with => '92123')
        fill_in('Description', :with => 'The chicken was very tasty')
        find('#create_review input').click
        expect(page).to have_content('The chicken was very tasty')
        find('#review').click
        expect(page).to have_content('fried chicken')
      end

      Then 'I can create another review' do
        find('#review').click
        find('#new_review').click
        fill_in('Restaurant name', :with => 'Denny')
        fill_in('Cuisine', :with => 'American')
        fill_in('Dish', :with => 'pancakes')
        fill_in('Price', :with => '5')
        select "✭✭✭✭", :from => "review[rating]"
        fill_in('Street', :with => '1550 G st.')
        fill_in('City', :with => 'San Diego')
        fill_in('State', :with => 'california')
        fill_in('Postalcode', :with => '91991')
        fill_in('Description', :with => 'The pancake was very tasty')
        find('#create_review input').click
        expect(page).to have_content('The pancake was very tasty')
        find('#review').click
        expect(page).to have_content('fried chicken')
        expect(page).to have_content('pancake')
      end

      Then 'I can create another review' do
        find('#review').click
        find('#new_review').click
        fill_in('Restaurant name', :with => 'ihop')
        fill_in('Cuisine', :with => 'American')
        fill_in('Dish', :with => 'eggs')
        fill_in('Price', :with => '11')
        select "✭✭✭✭", :from => "review[rating]"
        fill_in('Street', :with => '1550 G st.')
        fill_in('City', :with => 'San Diego')
        fill_in('State', :with => 'california')
        fill_in('Postalcode', :with => '92123')
        fill_in('Description', :with => 'The pancake was very tasty')
        find('#create_review input').click
        expect(page).to have_content('The pancake was very tasty')
        find('#review').click
        expect(page).to have_content('fried chicken')
        expect(page).to have_content('pancake')
      end

      Then "I can't create a review without selecting a rating" do
        find('#review').click
        find('#new_review').click
        fill_in('Restaurant name', :with => 'Olive Garden')
        fill_in('Cuisine', :with => 'Italian')
        fill_in('Dish', :with => 'Pasta')
        fill_in('Price', :with => '18')
        fill_in('Street', :with => '1550 b st.')
        fill_in('City', :with => 'San Diego')
        fill_in('State', :with => 'california')
        fill_in('Postalcode', :with => '92126')
        fill_in('Description', :with => 'The pasta was very tasty')
        find('#create_review input').click
        expect(page).to have_content("Rating can't be blank")
      end

      Then 'I can search for reviews' do
        find('#search_by').click
        expect(page).to have_content('fried chicken')
        fill_in('Search by Cuisine', :with => 'Southern')
        find('#find_it').click
        expect(page).to_not have_content('pancake')
      end

      Then 'I can search for multiple reviews' do
        find('#search_by').click
        expect(page).to have_content('fried chicken')
        fill_in('Search by Cuisine', :with => 'Southern')
        fill_in('Search by Location', :with => '92123')
        find('#find_it').click
        expect(page).to_not have_content('pancake')
        expect(page).to_not have_content('eggs')
        expect(page).to have_content('Southern')
      end
    end #Steps
  end #context
end # RSpec
