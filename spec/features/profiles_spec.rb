require 'rails_helper'

RSpec.feature "ProfilePage", type: :feature do
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
        expect(page).to have_content("Create Account")
      end
      Then 'I can sign up' do
        fill_in('Email', :with => 'test@gmail.com')
        fill_in('user_password', :with => 'password')
        fill_in('user_password_confirmation', :with => 'password')
        click_button('Sign up')
        expect(page).to have_content("New Profile")
        expect(page).to have_content ("@")
        expect(page).to have_content ("About me")
        attach_file "profile_image", Rails.root + "/Users/learn/desktop/Consumable_app/app/assets/images/friedchicken.jpg"
        fill_in('Name', :with => 'Test')
        select "2011", :from => "profile_birthday_1i"
        select "November", :from => "profile_birthday_2i"
        select "30", :from => "profile_birthday_3i"
        fill_in('About me', :with => 'Im am older than 5')

        click_button('Create Profile')
        expect(page).to have_content("Profile was successfully created.")
        expect(page).to have_content("2011")
        expect(page).to have_content("Im am older than 5")
        expect(page).to have_content("My Wishlist")
        click_link('Logout')
      end
      And "Create a profile automatically with image" do
        visit '/'
        click_link('sign_up')
        expect(page).to have_content("Create Account")
        fill_in('Email', :with => 'test2@gmail.com')
        fill_in('user_password', :with => 'password')
        fill_in('user_password_confirmation', :with => 'password')
        click_button('Sign up')
        expect(page).to have_content("New Profile")
        expect(page).to have_content ("@")
        expect(page).to have_content ("About me")
        attach_file "profile_image", Rails.root + "/Users/learn/desktop/Consumable_app/app/assets/images/friedchicken.jpg"
        fill_in('Name', :with => 'Test2')
        select "2012", :from => "profile_birthday_1i"
        select "December", :from => "profile_birthday_2i"
        select "31", :from => "profile_birthday_3i"
        fill_in('About me', :with => 'Im am older than 8')
        click_button('Create Profile')
        expect(page).to have_content("Profile was successfully created.")
        expect(page).to have_content("2012")
        expect(page).to have_content("Im am older than 8")
        expect(page).to have_xpath("//img[contains(@src,'friedchicken.jpg')]")
        click_link('Logout')
        expect(page).to have_content('Log In')
        expect(page).to have_content('Sign Up')
      end

      And "Create a profile automatically witout image" do
        visit '/'
        click_link('sign_up')
        expect(page).to have_content("Create Account")
        fill_in('Email', :with => 'test3@gmail.com')
        fill_in('user_password', :with => 'password')
        fill_in('user_password_confirmation', :with => 'password')
        click_button('Sign up')
        expect(page).to have_content("New Profile")
        expect(page).to have_content ("@")
        expect(page).to have_content ("About me")
        fill_in('Name', :with => 'Test2')
        select "2012", :from => "profile_birthday_1i"
        select "December", :from => "profile_birthday_2i"
        select "31", :from => "profile_birthday_3i"
        fill_in('About me', :with => 'Im am older than 8')
        click_button('Create Profile')
        expect(page).to have_content("Profile was successfully created.")
        expect(page).to have_content("2012")
        expect(page).to have_content("Im am older than 8")
        expect(page).to have_xpath("//img[contains(@src,'user_font_awesome.png')]")
        click_link('Logout')
        expect(page).to have_content('Log In')
        expect(page).to have_content('Sign Up')
      end

      And "View it" do
        click_link('Log In')
        fill_in('user_email', :with => 'test@gmail.com')
        fill_in('user_password', :with => 'password')
        click_button('Log in')
        expect(page).to have_content('My Profile')
        expect(page).to have_content('My Wishlists')
        click_link("My Profile")
        expect(page).to have_content("2011")
        expect(page).to have_content("Im am older than 5")
      end
      Then 'I can create a review with an image' do
        visit '/reviews/new'
        fill_in('Restaurant name', :with => 'popeyes')
        fill_in('Cuisine', :with => 'Southern')
        fill_in('Dish', :with => 'fried chicken')
        fill_in('Price', :with => '$10')
        select "✭✭✭", :from => "review[rating]"
        fill_in('Street', :with => '1550 Market st.')
        fill_in('City', :with => 'San Diego')
        fill_in('State', :with => 'fried chicken')
        fill_in('Postalcode', :with => '92123')
        fill_in('Description', :with => 'The chicken was very tasty')
        attach_file "review_image", Rails.root + "/Users/learn/desktop/Consumable_app/app/assets/images/friedchicken.jpg"
        find('#create_review').click
        expect(page).to have_content('The chicken was very tasty')
      end
      Then "When I click My Profile I can view my reviews" do
        click_link("My Profile")
        expect(page).to have_content("Image")
        expect(page).to have_content("Restaurant name")
        expect(page).to have_content("Cuisine")
        expect(page).to have_content("Dish")
        expect(page).to have_content("Price")
        expect(page).to have_content("Rating")
        expect(page).to have_content("Street")
        expect(page).to have_content("City")
        expect(page).to have_content("State")
        expect(page).to have_content("Postalcode")
        expect(page).to have_content("Description")
        expect(page).to have_content("User")
        click_link("Create Review")
      end
    end #Steps
  end #context
end #Rspec
