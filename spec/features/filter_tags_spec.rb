require 'spec_helper'

# As a time-pressed user
# So that I can quickly find links on a particular topic
# I would like to filter links by tag

feature 'User Story Three: find links on a particular topic' do
  scenario 'I would like to filter links by tag' do
    link = Link.new(url: 'www.bbc.co.uk', title: 'BBC')
    tag =  Tag.first_or_create(name: 'news')
    link.tags << tag
    link.save

    link = Link.new(url: 'https://www.pinterest.com/semsemaf/happy-bubbles/', title: 'happy bubbles')
    tag =  Tag.first_or_create(name: 'bubbles')
    link.tags << tag
    link.save


    visit ('/tags/bubbles')
      expect(page).to have_content 'bubbles'
      expect(page).not_to have_content 'news'
  end
end
