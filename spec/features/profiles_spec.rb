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
      Then 'I can sign up, create a profile and view it' do
        fill_in('Email', :with => 'test@gmail.com')
        fill_in('user_password', :with => 'password')
        fill_in('user_password_confirmation', :with => 'password')
        click_button('Sign up')
        expect(current_path).to eq('/')
        expect(page).to have_content("Consumable")
        expect(page).to have_content ("@")
        click_link('My Profile')
        click_link('New Profile')
        fill_in('Name', :with => 'Test')
        select "2011", :from => "profile_birthday_1i"
        select "November", :from => "profile_birthday_2i"
        select "30", :from => "profile_birthday_3i"
        fill_in('About me', :with => 'Im am older than 5')
        click_button('Create Profile')
        expect(page).to have_content("Profile was successfully created.")
      end
    end #Steps
  end #context
end #Rspec
