require 'spec_helper'

# User Story 2
#
# As a time-pressed user
# So that I can organise my many links into different categories for ease of search
# I would like to tag links in my bookmark manager

feature 'User Story Two: I would like to tag links' do
  scenario 'I can tag one link' do
    visit ('/links')

    click_link ('Add link')

    fill_in(:title, with: 'BBC')
    fill_in(:url, with: 'www.bbc.co.uk')
    fill_in(:tags, with: 'news')

    click_button ('Submit')

    link = Link.first
    expect(link.tags.map(&:name)).to include('news')

  end
end
