require 'spec_helper'

# User Story 5

# As a time-pressed user
# So that I can organise my links into different categories for ease of search
# I would like to add tags to the links in my bookmark manager

feature 'User Story 5: add multiple tags' do
  scenario 'I would like to be able to add multiple tags' do

    visit ('/links')

    click_link ('Add link')

    fill_in(:title, with: 'BBC')
    fill_in(:url, with: 'www.bbc.co.uk')
    fill_in(:tags, with: 'news UK')

    click_button ('Submit')

    link = Link.first
    expect(link.tags.map(&:name)).to include('news', 'UK')

  end
end
