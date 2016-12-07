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
        expect(page).to have_content("Sign up")
      end
      Then 'I can sign up' do
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
        expect(page).to have_content("My Wishlist")
        click_link('Logout')
      end
      And "Create a profile automatically" do
        visit '/'
        click_link('sign_up')
        expect(page).to have_content("Sign up")
        fill_in('Email', :with => 'test2@gmail.com')
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
        click_button('Update Profile')
        expect(page).to have_content("Profile was successfully updated.")
        expect(page).to have_content("2012")
        expect(page).to have_content("Im am older than 8")
        click_link('Logout')
        expect(page).to have_content('Log In')
        expect(page).to have_content('Sign Up')
      end
      And "View it" do
        click_link('Log In')
        fill_in('user_email', :with => 'test@gmail.com')
        fill_in('user_password', :with => 'password')
        click_button('Log in')
        expect(page).to have_content('Logout')
        expect(page).to have_content('2011')
        click_link("My Profile")
        expect(page).to have_content("2011")
        expect(page).to have_content("Im am older than 5")

      end
    end #Steps
  end #context
end #Rspec
