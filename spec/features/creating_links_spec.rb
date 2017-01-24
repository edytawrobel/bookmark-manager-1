require 'spec_helper'

# User Story 2
#
# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to my bookmark manager

feature 'User Story 2: add a url with a name to the bookmark manager' do
  scenario 'I can save a website' do

    visit ('/links')

    click_link ('Add link')

    fill_in(:title, with: 'BBC')
    fill_in(:url, with: 'www.bbc.co.uk')

    click_button ('Submit')

    within 'ul#links' do
      expect(page).to have_content 'BBC'
    end

  end
end
