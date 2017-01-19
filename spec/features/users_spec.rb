require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  context 'Going to website' do
    Steps 'Being welcomed' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can see a welcome message' do
        expect(page).to have_content ("Welcome to Consumable")
        expect(page).to have_content ("Profile")
        expect(page).to have_content ("Reviews")
        expect(page).to have_content ("Log In")
        expect(page).to have_content ("Sign Up")
      end
    end

    Steps 'to review profiles' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can click the profile link' do
        click_link('Profile')
      end
      And 'I can see the profiles page' do
        expect(page).to have_content ("Name")
        expect(page).to have_content ("Birthday")
        expect(page).to have_content ("About me")
      end
    end

    Steps 'to review profiles' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can click the profile link' do
        click_link('Reviews')
      end
      And 'I can see the profiles page' do
        expect(page).to have_content ("Latest Reviews")
        expect(page).to have_content ("Image")
        expect(page).to have_content ("Restaurant name")
      end
    end

    Steps 'signup' do
      Given 'I that I am on the sign up page' do
        visit '/'
        click_link('sign_up')
        expect(page).to have_content("Create Account")
      end
      Then 'I can sign up' do
        fill_in('Email', :with => 'test@gmail.com')
        fill_in('user_password', :with => 'password')
        fill_in('user_password_confirmation', :with => 'password')
        click_button('Sign up')
        expect(page).to have_content("Consumable")
        expect(page).to have_content ("@")
        expect(page).to have_content ("Birthday")
      end
    end

    Steps 'login' do
      Given 'I that I am on the sign up page' do
        visit '/'
        click_link('sign_up')
        expect(page).to have_content("Create Account")
      end
      Then 'I can sign up' do
        fill_in('Email', :with => 'test@gmail.com')
        fill_in('user_password', :with => 'password')
        fill_in('user_password_confirmation', :with => 'password')
        click_button('Sign up')
        expect(page).to have_content("Consumable")
        expect(page).to have_content ("@")
        expect(page).to have_content ("Birthday")
      end

      Then 'I am logged out' do
        click_link('Logout')
        # expect(page).to_not have_content ("@")
      end

      Then 'I am on the login page' do
        click_link('nav_log_in')
        expect(page).to have_content ("Forgot your password")
      end

      Then 'I can log in' do
        fill_in('Email', :with => 'test@gmail.com')
        fill_in('user_password', :with => 'password')
      end

      And 'I can click the log in button' do
        find('#log_in').click
      end

      # Then 'I will be on the logg' do
      # #   expect(current_path).to eq('/')
      # expect(page).to have_content("Concerns?")
      # expect(page).to have_content ("test@gmail.com")
      # end
    end
  end
end # RSpec


# shared_steps 'login' do
#   When 'I go to login page' do
#     visit '/login'
#   end
#   When 'I put credentials' do
#     fill_in 'Login', with: 'jack@example.com'
#     fill_in 'Password', with: 'password'
#   end
#   Then 'I should be logged in' do
#     expect(page).to have_content('Welcome jack@example.com')
#   end
# end
#
# shared_steps 'logout' do
#   visit '/logout'
#   expect(page.status_code).to eq(200)
# end



    # it "should go to the landing page" do
    #     visit '/'
    #     expect(page). to have_content ("Welcome to Consumable")
    # end
    #
    # it "should sign up" do
    #   visit '/'
    #   expect(page). to have_content ("Welcome to Consumable")
    #   click_button ("sign_up")
    #   visit '/users/sign_up'
    #   expect(page).to have_content("Create Account")
    #   fill_in('Email', :with => 'test@gmail.com')
    #   fill_in('Password', :with => 'password')
    #   fill_in('user_password_confirmation', :with => 'password')
    #   click_button('Sign up')
    #   expect(current_path).to eq('/')
    #   expect(page).to have_content("Consumable")
    #   expect(page). to have_content ("@")
    # end
    # #
    # # it "should log out" do
    # #   click_link('Logout')
    # #   expect(page). to_not have_content ("@")
    # # end
    #
    # # it "should log in" do
    # #   click_button 'btn btn-primary site-header-actions-btn'
    # # end
#   end
# end # RSpec
