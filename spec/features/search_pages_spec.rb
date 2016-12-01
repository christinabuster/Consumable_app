require 'rails_helper'

RSpec.feature "SearchPages", type: :feature do
  context 'I can search reviews' do
    Steps 'To search reviews' do
      Given 'I am on the landing page' do
        visit '/'
      end #given
      Then 'I can go to search page' do
        click_on 'Search By'
        visit '/search/search_by'
      end
      And 'I am in the search page' do
        expect(page).to have_content("Search Reviews")
        expect(page).to have_content("Find It")
      end
    end #steps
  end #context
end # RSpec
